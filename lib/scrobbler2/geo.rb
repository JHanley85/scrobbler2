module Scrobbler2
	class Geo < Base

		def initialize(location,options={})
			acceptable_options=['long','lat','location','distance','page','tag','festivalsonly','limit','country','metro','start','end']
			@query={ :location => location }
			options.each_pair do |option,value|
				unless acceptable_options.include?(option)
					raise "#{query} is an unacceptable option for Geo"
				end
			@query[option]=value
			end

		end

		has_resource :events, :root => "events"

		has_resource :top_artists, :root => "topartists"

		has_resource :top_tracks, :root => "toptracks"

	end
end
