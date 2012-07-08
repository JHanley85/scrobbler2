module Scrobbler2
  class Album < Base
    
    def initialize(artist, album)
      @query = {:artist => artist, :album => album}
    end
    
     has_resource :info, :root => 'album'
	   has_resource :buylinks, :root=>'affiliations'
	   has_resource :shouts, :root=>'shouts'
	   has_resource :tags, :root=>'tags'
	   has_resource :top_tags, :root=>'toptags'

  end
end
