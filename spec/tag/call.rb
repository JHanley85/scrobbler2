require_relative '../spec_helper.rb'
$: << File.dirname(__FILE__) + "/../../../lib/"
describe "tags, non-auth" do
  before(:each) do
    @tag= Scrobbler2::Tag.new(:tag => 'Electronic') #LastFM is down, can't access real tag id.'
    @tag.class.stub!(:get).and_return Hash.new
  end
  it "should have a default query" do
    @tag.instance_variable_get(:@query).should =={:tag => 'Electronic'}
  end
  it "info should call get with nil" do
    @tag.class.should_receive(:get).with('tag.getinfo', {:tag => 'Electronic'}, {})
    @tag.info
  end
  it "similar should call get with nil" do
    @tag.class.should_receive(:get).with('tag.getsimilar', {:tag => 'Electronic'}, {})
    @tag.similar
  end
  it "top_albums should call get with nil" do
    @tag.class.should_receive(:get).with('tag.gettopalbums', {:tag => 'Electronic'}, {})
    @tag.top_albums
  end
  it "top_artists should call get with nil" do
    @tag.class.should_receive(:get).with('tag.gettopartists', {:tag => 'Electronic'}, {})
    @tag.top_artists
  end
  it "top_tags should call get with nil" do
    @tag.class.should_receive(:get).with('tag.gettoptags', {:tag => 'Electronic'}, {})
    @tag.top_tags
  end
  it "top_tracks should call get with nil" do
    @tag.class.should_receive(:get).with('tag.gettoptracks', {:tag => 'Electronic'}, {})
    @tag.top_tracks
  end
  it "weekly_artist_chart should call get with nil" do
    @tag.class.should_receive(:get).with('tag.weeklyartistchart', {:tag => 'Electronic'}, {})
    @tag.weekly_artist_chart
  end
  it "weekly_chart_list should call get with nil" do
    @tag.class.should_receive(:get).with('tag.weeklychartlist', {:tag => 'Electronic'}, {})
    @tag.weekly_chart_list
  end


end

