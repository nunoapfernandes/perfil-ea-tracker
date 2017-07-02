require 'rest-client'
require 'json'
require 'mysql2'

module TMDB
	class App
		
		attr_accessor :client
		def initialize
			@client = Mysql2::Client.new(:host => "localhost", :username => "root", :password => "123", :database => "trackdb")
        end

		def run
			data = @client.query("SELECT id_media, tmdb, season.number as season_number, episode.number as episode_number FROM media INNER JOIN episode ON id_media = media_id INNER JOIN season ON season_id = id_season WHERE image_path IS NULL");
			data.each do |row|
				id_media = row["id_media"]
				tmdb = row["tmdb"]
				season_number = row["season_number"]
				episode_number = row["episode_number"]
				
				request = "https://api.themoviedb.org/3/tv/"+tmdb.to_s+
							"/season/"+season_number.to_s+
							"/episode/"+episode_number.to_s+
							"?api_key=29a3599e75cc9f95557283c10f79d4e4&language=en-US"
				print request + "\n"
				begin
					response = RestClient.get request
					http_code = response.code 

					if (http_code == 200)
						json = JSON.parse(response)
						image_path = json["still_path"]
						statement = @client.prepare("UPDATE media SET image_path = ? WHERE id_media = ?")
						result = statement.execute(image_path,id_media)
					end
				rescue => e
					print e.response
				end
			end
		end
	end
end


TMDB::App.new.run if __FILE__ == $0
