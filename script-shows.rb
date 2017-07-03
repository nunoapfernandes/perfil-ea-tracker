require 'rest-client'
require 'json'
require 'pg'

module Trakt

	class ConnectionData

		attr_accessor :headers, :response 

		def initialize
			@headers = {
				:content_type => 'application/json',
				:trakt_api_version => '2',
				:trakt_api_key => '946480128130afd29380d12e54fba28a41371dd3750e6e218c7aa6b5bfe9c64b'
			}
			@response = nil
		end

		def get_trending()
			@request = 'https://api.trakt.tv/shows/trending'
			@response = RestClient.get @request, @headers
			@slugs = []
			json = JSON.parse(@response)
			
			json.map { |show| show["show"]["ids"]["slug"] }.each do |show|
				@slugs <<  show
			end
			@slugs
		end

		def get_show_info(slug)
			@request = "https://api.trakt.tv/shows/" + slug + "?extended=full"
			@response = RestClient.get @request, @headers
			show_info = JSON.parse(@response)
		end

		def get_number_of_seasons(slug)
			@request = "https://api.trakt.tv/shows/" + slug + "/seasons"
			@response = RestClient.get @request, @headers
			json = JSON.parse(@response)
			seasons_number = 0
			json.map { |season| season["number"] }.each do |id|
				seasons_number = seasons_number + 1 if id > 0
			end	
			seasons_number
		end

		def get_seasons_info(slug)
			@request = "https://api.trakt.tv/shows/" + slug + "/seasons?extended=full&language=en"
			@response = RestClient.get @request, @headers
			seasons = [] 
			json = JSON.parse(@response)
			json.each { |season| 
				if season["number"] > 0
					seasons << season
				end
			}
			seasons
		end
		
		def get_episodes_info(slug,season_number)
			@request = "https://api.trakt.tv/shows/"+slug+"/seasons/"+season_number.to_s+"?extended=full&translations=en"
			@response = RestClient.get @request, @headers
			episodes = []
			json = JSON.parse(@response)
			json
		end
	end

    class App

        attr_accessor :client

        def initialize
			@client = PG.connect(:host=>'localhost', :port=>5432, :user=>'postgres', :password=>'postgres',:dbname=>'trackdb')
        end

		def get_genre_ids(genres,id)
			genre_ids = {}
			gid = 0
			genres.each do |genre|
				@client.prepare('genre'+id.to_s+gid.to_s,"SELECT id_genre FROM genre WHERE genre = $1")
				result = @client.exec_prepared('genre'+id.to_s+gid.to_s,[genre])
				gid=gid+1
				result.each do |name|
					genre_ids[genre] = name["id_genre"]
				end
			end
			genre_ids
		end

		def insert_show_into_db(show_info,seasons,id)
			title = show_info["title"]
			slug = show_info["ids"]["slug"]
			imdb = show_info["ids"]["imdb"]
			tmdb = show_info["ids"]["tmdb"]
			overview = show_info["overview"]
			first_aired = show_info["first_aired"]
			aired_day = show_info["airs"]["day"]
			aired_time = show_info["airs"]["time"]
			aired_timezone = show_info["airs"]["timezone"]
			runtime = show_info["runtime"]
			certification = show_info["certification"]
			network	= show_info["network"]
			country = show_info["country"]
			trailer = show_info["trailer"]
			homepage = show_info["homepage"]
			status = show_info["status"]
			rating = show_info["rating"]
			language = show_info["language"]
			aired_episodes = show_info["aired_episodes"]
			genres = show_info["genres"] 
			genre_ids = get_genre_ids(genres,id)
				
			request = 'https://api.themoviedb.org/3/tv/'+tmdb.to_s+'?api_key=29a3599e75cc9f95557283c10f79d4e4&language=en-US'
			response = RestClient.get request
			data = JSON.parse(response)
			image_path = data["poster_path"]

			@client.prepare('media'+id.to_s,"INSERT INTO media(title,tmdb,overview,rating_trakt,released,image_path,category)
												VALUES($1,$2,$3,$4,$5,$6,$7) returning id_media")

			result = @client.exec_prepared('media'+id.to_s,[title,tmdb,overview,rating,first_aired,image_path,1])
			id_media = result.first["id_media"]
		
			@client.prepare('show'+id.to_s,"INSERT INTO tvshow(slug,imdb,aired_day,aired_time,aired_timezone,runtime,
												certification,network,country,trailer,homepage,status,language,
												aired_episodes,seasons,show_id) VALUES($1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12,$13,$14,$15,$16)")
			@client.exec_prepared('show'+id.to_s,[slug,imdb,aired_day,aired_time,aired_timezone,runtime,certification,network,country,
												trailer,homepage,status,language,aired_episodes,seasons,id_media])

			@client.prepare('genres'+id.to_s,"INSERT INTO media_genre(medias_id_media,genres_id_genre) VALUES($1,$2)")
			genres.each do |genre| 
				@client.exec_prepared('genres'+id.to_s,[id_media,genre_ids[genre]])
			end

			id_media # show_id
		end

		def insert_season_into_db(season,show_id,show_tmdb,id)
			title = season["title"]
			overview = season["overview"]
			rating = season["rating"]
			released = season["first_aired"]
			episodes = season["episode_count"]
			aired_episodes = season["aired_episodes"]
			season_number = season["number"]
			request = "https://api.themoviedb.org/3/tv/"+
						show_tmdb.to_s+"/season/"+season_number.to_s+
						"?api_key=29a3599e75cc9f95557283c10f79d4e4&language=en-US"
			response = RestClient.get request
			data = JSON.parse(response)
			image_path = data["poster_path"]
		
			@client.prepare('media'+id.to_s+show_id.to_s+season_number.to_s,"INSERT INTO media(title,tmdb,overview,rating_trakt,released,image_path,category)
												VALUES($1,$2,$3,$4,$5,$6,$7) returning id_media")

			result = @client.exec_prepared('media'+id.to_s+show_id.to_s+season_number.to_s,[title,show_tmdb,overview,rating,released,image_path,1])
			id_media = result.first["id_media"]
		
			@client.prepare('season'+id.to_s+show_id.to_s+season_number.to_s,"INSERT INTO season(number,episodes,aired_episodes,show_id,season_id)
												VALUES($1,$2,$3,$4,$5)")
			@client.exec_prepared('season'+id.to_s+show_id.to_s+season_number.to_s,[season_number,episodes,aired_episodes,show_id,id_media])
			
			id_media # season_id
		end
			
		def insert_episode_into_db(episode,season_id,show_tmdb,id)
			title = episode["title"]
			overview = episode["overview"]
			rating = episode["rating"]
			released = episode["first_aired"]
			runtime = episode["runtime"]
			season_number = episode["season"]
			episode_number = episode["number"]
			imdb = episode["ids"]["imdb"]
			
			request = "https://api.themoviedb.org/3/tv/"+show_tmdb.to_s+
						"/season/"+season_number.to_s+
						"/episode/"+episode_number.to_s+
						"?api_key=29a3599e75cc9f95557283c10f79d4e4&language=en-US"
			begin
				response = RestClient.get request
				http_code = response.code
				if http_code == 200
					data = JSON.parse(response)
					image_path = data["still_path"]
				else
					image_path = nil
				end
			rescue => e
				e.response
			end

			@client.prepare('media'+id.to_s+season_id.to_s+episode_number.to_s,"INSERT INTO media(title,tmdb,overview,rating_trakt,released,image_path,category)
												VALUES($1,$2,$3,$4,$5,$6,$7) returning id_media")

			result = @client.exec_prepared('media'+id.to_s+season_id.to_s+episode_number.to_s,[title,show_tmdb,overview,rating,released,image_path,1])
			id_media = result.first["id_media"]
			
			@client.prepare('episode'+id.to_s+season_id.to_s+episode_number.to_s,"INSERT INTO episode(number,imdb,runtime,season_id,episode_id)
												VALUES($1,$2,$3,$4,$5)")
			@client.exec_prepared('episode'+id.to_s+season_id.to_s+episode_number.to_s,[episode_number,imdb,runtime,season_id,id_media])
			
		end 

        def run
            connection_data = Trakt::ConnectionData.new
			@slugs = connection_data.get_trending()
			id=0
			@slugs.each { |slug| 
				print slug
				print ":\n"
				show = connection_data.get_show_info(slug) 
				number_seasons = connection_data.get_number_of_seasons(slug)
				show_id = insert_show_into_db(show,number_seasons,id)
				seasons = connection_data.get_seasons_info(slug)
				seasons.each { |season|
					print "Season: " + season["number"].to_s
					season_id = insert_season_into_db(season,show_id,show["ids"]["tmdb"],id)
					episodes = connection_data.get_episodes_info(slug,season["number"])
					episodes.each { |episode|
						print " Episode: " + episode["number"].to_s
						insert_episode_into_db(episode,season_id,show["ids"]["tmdb"],id)
					}
				}
				id=id+1
			}
        end

    end
end

Trakt::App.new.run if __FILE__ == $0
