module Scrobbler2
	class Chart < Base

		def initialize
			@query = nil
		end

		has_resource :hyped_artists, :root => 'artists'
		has_resource :hyped_tracks, :root=>'tracks'
		has_resource :loved_tracks, :root=>'tracks'
		has_resource :top_artists, :root=>'artists'
		has_resource :top_tags, :root=>'tags'
		has_resource :top_tracks, :root=>'tracks'

	end
end
