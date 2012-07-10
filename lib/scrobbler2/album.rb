module Scrobbler2
  class Album < Base
    
    def initialize(options)
      acceptable_options=[:artist,:album]
      if options.present? && options.kind_of?(Hash)
        options.each_pair do |option, value|
          unless acceptable_options.include?(option)
            raise "#{option} is an unacceptable option for Geo"
          end
          @query[option]=value
        end
      else
        raise "You must provide a Hash with at minimum :artist, and :album."
      end
    end
    
     has_resource :info, :root => 'album'
	   has_resource :buylinks, :root=>'affiliations'
	   has_resource :shouts, :root=>'shouts'
	   has_resource :tags, :root=>'tags'
	   has_resource :top_tags, :root=>'toptags'

  end
end
