require_relative '../spec_helper.rb'
$: << File.dirname(__FILE__) + "/../../../lib/"
describe "groups, non-auth" do
  before(:each) do
    @group= Scrobbler2::Group.new(:location=>'San Francisco') #LastFM is down, can't access real group id.'
    @group.class.stub!(:get).and_return Hash.new
  end
  it "should have a default query" do
    @group.instance_variable_get(:@query).should  =={:location=>'San Francisco'}
  end
  it "events should call get with nil" do
    @group.class.should_receive(:get).with('group.getevents',{:location=>'San Francisco'},{})
    @group.events
  end
  it "top_tracks should call get with nil" do
    @group.class.should_receive(:get).with('group.gettoptracks',{:location=>'San Francisco'},{})
    @group.top_tracks
  end
  it "top_artists should call get with nil" do
    @group.class.should_receive(:get).with('group.gettopartists',{:location=>'San Francisco'},{})
    @group.top_artists
  end
  it "metro_artist_chart should call get with nil" do
    @group.class.should_receive(:get).with('group.getmetroartistchart',{:location=>'San Francisco'},{})
    @group.metro_artist_chart
  end
  it "metro_hype_artist_chart should call get with nil" do
    @group.class.should_receive(:get).with('group.getmetrohypeartistchart',{:location=>'San Francisco'},{})
    @group.metro_hype_artist_chart
  end
  it "metro_hype_track_chart should call get with nil" do
    @group.class.should_receive(:get).with('group.getmetrohypetrackchart',{:location=>'San Francisco'},{})
    @group.metro_hype_track_chart
  end
  it "metro_track_chart should call get with nil" do
    @group.class.should_receive(:get).with('group.getmetrotrackchart',{:location=>'San Francisco'},{})
    @group.metro_track_chart
  end
  it "metro_unique_artist_chart should call get with nil" do
    @group.class.should_receive(:get).with('group.getmetrouniqueartistchart',{:location=>'San Francisco'},{})
    @group.metro_unique_artist_chart
  end
  it "metro_unique_track_chart should call get with nil" do
    @group.class.should_receive(:get).with('group.getmetrouniquetrackchart',{:location=>'San Francisco'},{})
    @group.metro_unique_track_chart
  end
  it "metro_weekly_chartlist should call get with nil" do
    @group.class.should_receive(:get).with('group.getmetroweeklychartlist',{:location=>'San Francisco'},{})
    @group.metro_weekly_chartlist
  end
  it "metros should call get with nil" do
    @group.class.should_receive(:get).with('group.getmetros',{:location=>'San Francisco'},{})
    @group.metros
  end

end

