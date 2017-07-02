require 'rest-client'
require 'json'
require 'mysql2'

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
			@client = Mysql2::Client.new(:host => "localhost", :username => "root", :password => "123", :database => "trackdb")
        end

		def get_genre_ids(genres)
			genre_ids = {}
			statement = @client.prepare("SELECT id_genre FROM genre WHERE genre = ?")
			genres.each do |genre|
				result = statement.execute(genre)
				if result.size > 0
					result.each do |name|
						genre_ids[genre] = name["id_genre"]
					end
				end
			end
			genre_ids
		end

		def insert_show_into_db(show_info,seasons)
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
			rating_trakt = show_info["rating"]
			language = show_info["language"]
			aired_episodes = show_info["aired_episodes"]
			genres = show_info["genres"] 
			genre_ids = get_genre_ids(genres)
				
			request = 'https://api.themoviedb.org/3/tv/'+tmdb.to_s+'?api_key=29a3599e75cc9f95557283c10f79d4e4&language=en-US'
			response = RestClient.get request
			data = JSON.parse(response)
			image_path = data["poster_path"]

			statement = @client.prepare("INSERT INTO media(title,tmdb,overview,rating_trakt,released,image_path,category)
												VALUES(?,?,?,?,?,?,?)")
			result = statement.execute(title,tmdb,overview,rating_trakt,first_aired,image_path,2)
			id_media = @client.last_id
		
			statement = @client.prepare("INSERT INTO trackdb.show(slug,imdb,aired_day,aired_time,aired_timezone,runtime,
												certification,network,country,trailer,homepage,status,language,
												aired_episodes,seasons,media_id) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)")
			result = statement.execute(slug,imdb,aired_day,aired_time,aired_timezone,runtime,certification,network,country,
												trailer,homepage,status,language,aired_episodes,seasons,id_media)
			id_show = @client.last_id

			statement = @client.prepare("INSERT INTO show_has_genre(show_id,genre_id) VALUES(?,?)")
			genres.each do |genre| 
				result = statement.execute(id_show,genre_ids[genre])
			end
			id_show
		end

		def insert_season_into_db(season,show_id,show_tmdb)
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
		
			statement = @client.prepare("INSERT INTO media(title,tmdb,overview,rating_trakt,released,image_path,category)
												VALUES(?,?,?,?,?,?,?)")
			result = statement.execute(title,show_tmdb,overview,rating,released,image_path,3)
			id_media = @client.last_id
		
			statement = @client.prepare("INSERT INTO season(number,episodes,aired_episodes,show_id,media_id)
												VALUES(?,?,?,?,?)")
			result = statement.execute(season_number,episodes,aired_episodes,show_id,id_media)
			id_season = @client.last_id

			id_season
		end
			
		def insert_episode_into_db(episode,season_id,show_tmdb)
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

			statement = @client.prepare("INSERT INTO media(title,tmdb,overview,rating_trakt,released,image_path,category)
												VALUES(?,?,?,?,?,?,?)")
			result = statement.execute(title,show_tmdb,overview,rating,released,image_path,4)
			id_media = @client.last_id
			
			statement = @client.prepare("INSERT INTO episode(number,imdb,runtime,season_id,media_id)
												VALUES(?,?,?,?,?)")
			result = statement.execute(episode_number,imdb,runtime,season_id,id_media)
			
		end 

        def run
            connection_data = Trakt::ConnectionData.new
			@slugs = connection_data.get_trending()
			@slugs.each { |slug| 
				print slug
				print ":\n"
				show = connection_data.get_show_info(slug) 
				number_seasons = connection_data.get_number_of_seasons(slug)
				show_id = insert_show_into_db(show,number_seasons)
				seasons = connection_data.get_seasons_info(slug)
				seasons.each { |season|
					print "Season: " + season["number"].to_s
					season_id = insert_season_into_db(season,show_id,show["ids"]["tmdb"])
					episodes = connection_data.get_episodes_info(slug,season["number"])
					episodes.each { |episode|
						print " Episode: " + episode["number"].to_s
						insert_episode_into_db(episode,season_id,show["ids"]["tmdb"])
					}
					print "\n"
				}
			}
        end

    end
end

Trakt::App.new.run if __FILE__ == $0
