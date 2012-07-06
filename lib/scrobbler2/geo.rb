module Scrobbler2
	class Geo < Base

		def initialize(location,options={})
			@query={ :location => location }
			options.each_pair do |option,value|
			@query[option]=value
			end
			@query
		end

		has_resource :events, :root => "events"

		has_resource :top_artists, :root => "topartists"

		has_resource :top_tracks, :root => "toptracks"

	end
end
