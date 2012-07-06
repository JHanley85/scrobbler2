module Scrobbler2
	class Geo < Base

		def initialize(options={ })
			acceptable_options=[:long, :lat, :location, :distance, :page, :tag, :festivalsonly, :limit, :country, :metro, :start, :end]
			unless options.nil?
				@query=Hash.new
				options.each_pair do |option, value|
					unless acceptable_options.include?(option)
						raise "#{option} is an unacceptable option for Geo"
					end
					@query[option]=value
				end
			end
		end

		has_resource :events, :root => "events"
		has_resource :top_artists, :root => "topartists"
		has_resource :top_tracks, :root => "toptracks"


	end

end
