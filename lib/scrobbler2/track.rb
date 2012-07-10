module Scrobbler2
  class Track < Base
    
    def initialize(artist, track)
      @query = {:artist => artist, :track => track}
    end

    has_resource :buylinks, :root=>'buylinks'
    has_resource :correction, :root=>"corrections"
    has_resource :fingerprint_metadata, :root=>"fingerprintmetadata"
    has_resource :info, :root => 'track'
    has_resource :shouts, :root=>'shouts'
    has_resource :similar, :root => 'similartracks'
    has_resource :tags, :root=>'tags'
    has_resource :top_fans, :root => 'topfans'
    has_resource :top_tags, :root => 'toptags'


    def add_tags

    end
    def ban

    end
    def love

    end
    def remove_tag

    end
    def scrobble

    end
    def search

    end
    def share

    end
    def unban

    end
    def unlove

    end
    def update_now_playing

    end
  end
end
