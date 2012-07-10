module Scrobbler2
  class Album < Base
    
    def initialize(options)
      acceptable_options=[:artist,:album]
      if options.kind_of?(Hash) && options[:artist].present? && options[:album].present?
        options.each_pair do |option, value|
          unless acceptable_options.include?(option)
            raise "#{option} is an unacceptable option for Geo"
          end
          @query=options
        end
      else
        raise "You must provide a Hash with at minimum :artist, and :album."
      end
    end
    
     has_resource :info, :root => 'album'
	   has_resource :buylinks, :root=>'affiliations'
	   has_resource :shouts, :root=>'shouts'
	   has_resource :tags, :root=>'tags',:auth=>true
	   has_resource :top_tags, :root=>'toptags'


    def add_tags(tags)
      unless tags.kind_of?(String)
        raise "Tags must be string, comma delineated list. maxiumum 10 tags."
      end
      tag_array=tags.split(',')
      tags=tag_array.count>10 ? tag_array.first(10).join(",") : tag_array.join(',')
      artist=self.info.artist
      album=self.info.name
      query={:artist=>artist,:album=>album,:tags=>tags}
      self.class.post_with_auth("album.addtags", query)
    end
    def search(query, options={ })
      self.class.get('album.search', query, options)
    end

    def share(artist, album, recipient, options={ })
      recipient.join(',') if recipient.kind_of?(Array)
      query = @query.merge(:artist => artist, :album => album, :recipient => recipient)
      query = @query.merge options if options.present?
      self.class.post_with_auth('album.share', query)
    end
    def remove_tag(tag)
      artist=self.info.artist
      album=self.info.name
      tag=tag.split(",").first.to_s
      query={:artist=>artist,:album=>album,:tag=>tag}
      self.class.post_with_auth("album.removetag", query)
    end
  end
end
