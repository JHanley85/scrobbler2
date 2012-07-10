require_relative '../spec_helper.rb'
$: << File.dirname(__FILE__) + "/../../../lib/"
describe "geos, non-auth" do
  before(:each) do
    @geo= Scrobbler2::Geo.new(:location=>'San Francisco') #LastFM is down, can't access real geo id.'
    @geo.class.stub!(:get).and_return Hash.new
  end
  it "should have a default query" do
    @geo.instance_variable_get(:@query).should  =={:location=>'San Francisco'}
  end
  it "events should call get with nil" do
    @geo.class.should_receive(:get).with('geo.getevents',{:location=>'San Francisco'},{})
    @geo.events
  end
  it "top_tracks should call get with nil" do
    @geo.class.should_receive(:get).with('geo.gettoptracks',{:location=>'San Francisco'},{})
    @geo.top_tracks
  end
  it "top_artists should call get with nil" do
    @geo.class.should_receive(:get).with('geo.gettopartists',{:location=>'San Francisco'},{})
    @geo.top_artists
  end
  it "metro_artist_chart should call get with nil" do
    @geo.class.should_receive(:get).with('geo.getmetroartistchart',{:location=>'San Francisco'},{})
    @geo.metro_artist_chart
  end
  it "metro_hype_artist_chart should call get with nil" do
    @geo.class.should_receive(:get).with('geo.getmetrohypeartistchart',{:location=>'San Francisco'},{})
    @geo.metro_hype_artist_chart
  end
  it "metro_hype_track_chart should call get with nil" do
    @geo.class.should_receive(:get).with('geo.getmetrohypetrackchart',{:location=>'San Francisco'},{})
    @geo.metro_hype_track_chart
  end
  it "metro_track_chart should call get with nil" do
    @geo.class.should_receive(:get).with('geo.getmetrotrackchart',{:location=>'San Francisco'},{})
    @geo.metro_track_chart
  end
  it "metro_unique_artist_chart should call get with nil" do
    @geo.class.should_receive(:get).with('geo.getmetrouniqueartistchart',{:location=>'San Francisco'},{})
    @geo.metro_unique_artist_chart
  end
  it "metro_unique_track_chart should call get with nil" do
    @geo.class.should_receive(:get).with('geo.getmetrouniquetrackchart',{:location=>'San Francisco'},{})
    @geo.metro_unique_track_chart
  end
  it "metro_weekly_chartlist should call get with nil" do
    @geo.class.should_receive(:get).with('geo.getmetroweeklychartlist',{:location=>'San Francisco'},{})
    @geo.metro_weekly_chartlist
  end
  it "metros should call get with nil" do
    @geo.class.should_receive(:get).with('geo.getmetros',{:location=>'San Francisco'},{})
    @geo.metros
  end

end

