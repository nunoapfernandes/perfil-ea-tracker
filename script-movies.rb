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
			@request = 'https://api.trakt.tv/movies/trending'
			@response = RestClient.get @request, @headers
			@slugs = []
			json = JSON.parse(@response)
			json.map { |movie| movie["movie"]["ids"]["slug"] }.each do |movie|
				@slugs <<  movie
			end
			@slugs
		end

		def get_info_from_slug(slug)
			@request = "https://api.trakt.tv/movies/" + slug + "?extended=full"
			@response = RestClient.get @request, @headers
			json = JSON.parse(@response)
		end
	end

    class App

        def initialize
			@client = PG.connect(:host=>'localhost', :port=>5432, :user=>'postgres', :password=>'postgres',:dbname=>'trackdb')
        end

		def insert_into_db(movie,id)
			title = movie["title"]
			slug = movie["ids"]["slug"]
			imdb = movie["ids"]["imdb"]
			tmdb = movie["ids"]["tmdb"]
			tagline = movie["tagline"]
			overview = movie["overview"]
			released = movie["released"]
			runtime = movie["runtime"]
			trailer = movie["trailer"]
			homepage = movie["homepage"]
			rating = movie["rating"]
			language = movie["language"]
			genres = movie["genres"]
			certification = movie["certification"]

			request = 'https://api.themoviedb.org/3/movie/'+tmdb.to_s+'?api_key=29a3599e75cc9f95557283c10f79d4e4&language=en-US'
			begin
				response = RestClient.get request
				http_code = response.code
				if http_code == 200
					data = JSON.parse(response)
					image_path = data["backdrop_path"]
                    poster_path = data["poster_path"]
				else
					image_path = nil
                    poster_path = nil
				end
			rescue => e
				e.response
			end
			
			genre_ids = get_genre_ids(genres,id)
			@client.prepare('media'+id.to_s,"INSERT INTO media(title,tmdb,overview,rating_trakt,released,image_path,category)
												VALUES($1,$2,$3,$4,$5,$6,$7,$8) returning id_media")

			result = @client.exec_prepared('media'+id.to_s,[title,tmdb,overview,rating,released,image_path,poster_path,1])
			id_media = result.first["id_media"]
			
		
			@client.prepare('movie'+id.to_s,"INSERT INTO movie(slug,imdb,tagline,trailer,runtime,homepage,language,certification,id_media)
												VALUES($1,$2,$3,$4,$5,$6,$7,$8,$9)")
			result = @client.exec_prepared('movie'+id.to_s,[slug,imdb,tagline,trailer,runtime,homepage,language,certification,id_media])

			@client.prepare('genres'+id.to_s,"INSERT INTO media_genre(medias_id_media,genres_id_genre) VALUES($1,$2)")
			genres.each do |genre| 
				@client.exec_prepared('genres'+id.to_s,[id_media,genre_ids[genre]])
			end
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

        def run
            connection_data = Trakt::ConnectionData.new
			@slugs = connection_data.get_trending()
			id = 0
			@movie = {}
			@slugs.each { |slug| 
				print slug + "\n"
				@movie = connection_data.get_info_from_slug(slug)
				insert_into_db(@movie,id)
				id = id+1
			}
			
        end

    end
end

Trakt::App.new.run if __FILE__ == $0
