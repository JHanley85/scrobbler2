module Scrobbler2
	class Event < Base

		def initialize(event_id)
			@query = { :event => event_id }
		end

		has_resource :attendees, :root=>'attendees'
		has_resource :info, :root => 'event'
		has_resource :shouts, :root => 'shouts'

		def attend(status)
			#status (0=Attending, 1=Maybe attending, 2=Not attending)
			acceptable_status=["0", "1", "2"]
			unless status.kind_of?(String) && acceptable_status.include?(status)
				raise "Not a valid status, please use a string. (0=Attending, 1=Maybe attending, 2=Not attending) "
			end
			event_id=self.info.id
			query   =@query.merge(:event => event_id, :status => status)
			self.class.post_with_auth('event.attend', query)
		end
		def share( recipient, options={ })
			event=self.info.id
			recipient.join(',') if recipient.kind_of?(Array)
			query = @query.merge(:event => event, :recipient => recipient)
			query = @query.merge options if options.present?
			self.class.post_with_auth('event.share', query)
		end
		def shout(message)
			unless message.kind_of?(String)
				raise "Message must be a string. Please try again."
			end
			event=self.info.id
			query=@query.merge(:event=>event,:message=>message)
			self.class.post_with_auth('event.shout',query)
		end
	end
end
