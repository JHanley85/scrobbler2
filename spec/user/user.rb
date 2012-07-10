require_relative '../spec_helper.rb'
$: << File.dirname(__FILE__) + "/../../../lib/"
describe "Get information for user 'SJPollux' " do
  before(:all) do
    wait 30 do
      @user=Scrobbler2::User.new(:user=>'SJPollux')
      @artisttracks=@user.artist_tracks
      @bannedtracks=@user.banned_tracks
      @events=@user.events
      @friends=@user.friends
      @info=@user.info
      @lovedtracks=@user.loved_tracks
      @neighbors=@user.neighbors
      @newreleases=@user.new_releases
      @pastevents=@user.past_events
      @personaltags=@user.personal_tags
      @playlists=@user.playlists
      @recentstations=@user.recent_stations
      @recenttracks=@user.recent_tracks
      @recommendedartists=@user.recommended_artists
      @recommendedevents=@user.recommended_events
      @shouts=@user.shouts
      @topalbums=@user.top_albums
      @topartists=@user.top_artists
      @toptags=@user.top_tags
      @toptracks=@user.top_tracks
      @weeklyalbumchart=@user.weekly_album_chart
      @weeklyartistchart=@user.weekly_artist_chart
      @weeklychartlist=@user.weekly_chart_list
      @weeklytrackchart=@user.weekly_track_chart
    end
  end
  it "Should return the following as OpenStruct" do
    @artisttracks.should be_a_kind_of OpenStruct
    @bannedtracks.should be_a_kind_of OpenStruct
    @events.should be_a_kind_of OpenStruct
    @friends.should be_a_kind_of OpenStruct
    @info.should be_a_kind_of OpenStruct
    @lovedtracks.should be_a_kind_of OpenStruct
    @neighbors.should be_a_kind_of OpenStruct
    @newreleases.should be_a_kind_of OpenStruct
    @pastevents.should be_a_kind_of OpenStruct
    @personaltags.should be_a_kind_of OpenStruct
    @playlists.should be_a_kind_of OpenStruct
    @recentstations.should be_a_kind_of OpenStruct
    @recenttracks.should be_a_kind_of OpenStruct
    @recommendedartists.should be_a_kind_of OpenStruct
    @recommendedevents.should be_a_kind_of OpenStruct
    @shouts.should be_a_kind_of OpenStruct
    @topalbums.should be_a_kind_of OpenStruct
    @topartists.should be_a_kind_of OpenStruct
    @toptags.should be_a_kind_of OpenStruct
    @toptracks.should be_a_kind_of OpenStruct
    @weeklyalbumchart.should be_a_kind_of OpenStruct
    @weeklyartistchart.should be_a_kind_of OpenStruct
    @weeklychartlist.should be_a_kind_of OpenStruct
    @weeklytrackchart.should be_a_kind_of OpenStruct
  end

end
