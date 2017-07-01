require 'rest-client'
require 'json'
require 'mysql2'

module Trakt

	class ConnectionData

		attr_accessor :headers, :response, :type

		def initialize
			@headers = {
				:content_type => 'application/json',
				:trakt_api_version => '2',
				:trakt_api_key => '946480128130afd29380d12e54fba28a41371dd3750e6e218c7aa6b5bfe9c64b'
			}
			@response = nil
		end

		def get_trending()
			@request = 'https://api.trakt.tv/movies/trending?page=1&limit=1'
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
			@client = Mysql2::Client.new(:host => "localhost", :username => "root", :password => "123", :database => "trackdb")
        end

		def insert_into_db(movie)
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
			response = RestClient.get request
			data = JSON.parse(response)
			image_path = data["poster_path"]
			
			genre_ids = get_genre_ids(genres)

			statement = @client.prepare("INSERT INTO movie(title,slug,imdb,tmdb,tagline,overview,released,runtime,
											trailer,homepage,rating_trakt,language,certification,image_path)
								VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?)")
			result = statement.execute(title,slug,imdb,tmdb,tagline,overview,released,runtime,
											trailer,homepage,rating,language,certification,image_path)
			id_movie = @client.last_id

			statement = @client.prepare("INSERT INTO movie_has_genre(movie_id,genre_id) VALUES(?,?)")
			genres.each do |genre| 
				result = statement.execute(id_movie,genre_ids[genre])
			end
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

        def run
            connection_data = Trakt::ConnectionData.new
			@slugs = connection_data.get_trending()
			@movie = {}
			@slugs.each { |slug| 
				@movie = connection_data.get_info_from_slug(slug)
				insert_into_db(@movie)
			}
			
        end

    end
end

Trakt::App.new.run if __FILE__ == $0
