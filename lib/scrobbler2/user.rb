module Scrobbler2
  class User < Base
    
    def initialize(username)
      @query = {:user => username}
    end
    has_resource :artist_tracks, :root=>'tracks'
    has_resource :banned_tracks, :root=>'tracks'
    has_resource :events, :root => "events"
    has_resource :friends, :root=>'friends'
    has_resource :info, :root=>"user", :auth=>true, :query => {}
    has_resource :loved_tracks, :root => "lovedtracks"
    has_resource :neighbours, :root => "neighbours"
    has_resource :new_releases, :root=>"newreleases"
    has_resource :past_events, :root => "events"
    has_resource :personal_tags, :root=>'personaltags'
    has_resource :playlists, :root => "playlists"
    has_resource :recent_stations, :root=>'recentstations'
    has_resource :recent_tracks, :root => "recenttracks"
    has_resource :recommended_artists, :root => "recommendedartists", :auth => true, :query => {}
    has_resource :recommended_events, :root => "recommendedevents", :auth => true, :query => {}
    has_resource :shouts, :root => "shouts"
    has_resource :top_albums, :root => "topalbums"
    has_resource :top_artists, :root => "topartists"
    has_resource :top_tags, :root => "toptags"
    has_resource :top_tracks, :root => "toptracks"
    has_resource :weekly_album_chart, :root => "weeklyalbumchart"
    has_resource :weekly_artist_chart, :root => "weeklyartistchart"
    has_resource :weekly_chart_list, :root => "weeklychartlist"
    has_resource :weekly_track_chart, :root => "weeklytrackchart"

    def shout

    end
  end
end
