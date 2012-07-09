module Scrobbler2
	class Artist < Base

		def initialize(options)
			acceptable_options=[:artist, :mbid, :lang, :autocorrect, :username]
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

		has_resource :correction, :root => 'correction'
		has_resource :events, :root => 'events'
		has_resource :info, :root => 'artist'
		has_resource :past_events, :root => 'events'
		has_resource :shouts, :root => 'shouts'
		has_resource :similar, :root => 'similarartists'
		has_resource :tags, :root => "tags", :auth => true
		has_resource :top_albums, :root => 'topalbums'
		has_resource :top_fans, :root => 'topfans'
		has_resource :top_tags, :root => 'toptags'
		has_resource :top_tracks, :root => 'toptracks'

		def add_tags(tags)
			unless tags.kind_of?(String)
				raise "Tags must be string, comma delineated list. maxiumum 10 tags."
			end
			tag_array=tags.split(',')
			tags=tag_array.count>10 ? tag_array.first(10).join(",") : tag_array.join(',')
			artist=self.info.name
			query=Hash.new().merge(:artist=>artist).merge(:tags=>tags)
			self.class.post_with_auth("artist.addTags", query)
		end

		def search(query, options={ })
			self.class.get('artist.search', query, options)
		end

		def share(artist, album, recipient, options={ })
			recipient.join(',') if recipient.kind_of?(Array)
			query = @query.merge(:artist => artist, :album => album, :recipient => recipient)
			query = @query.merge options if options.present?
			self.class.post_with_auth('artist.share', query)
		end

		def remove_tag(tag)
			artist=self.info.name
			tag=tag.split(",").first.to_s
			query=Hash.new().merge(:artist=>artist).merge(:tag=>tag)
			self.class.post_with_auth("artist.removeTag", query)
		end
	end
end
