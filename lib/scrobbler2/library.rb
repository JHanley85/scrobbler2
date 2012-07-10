module Scrobbler2
  class Library < Base

    def initialize(user)
      @query = {:user => user}
    end

    has_resource :artists, :root => 'artists'
    has_resource :albums, :root => 'albums'
    has_resource :tracks, :root => 'tracks'

    def add_album

    end

    def add_artist

    end

    def add_track

    end

    def remove_album

    end

    def remove_artist

    end

    def remove_scrobble

    end

    def remove_track

    end
  end
end
