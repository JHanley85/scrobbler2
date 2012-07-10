require_relative '../spec_helper.rb'
$: << File.dirname(__FILE__) + "/../../../lib/"
describe "Artist, non-auth" do
  before(:each) do
    @artist = Scrobbler2::Artist.new(:artist => "Honeycut")
    @artist.class.stub!(:get).and_return Hash.new
  end
  it "should have a default query" do
    @artist.instance_variable_get(:@query).should =={:artist => "Honeycut"}
  end
  it "info should call get with :artist" do
    @artist.class.should_receive(:get).with('artist.getinfo',{:artist => "Honeycut"},{})
    @artist.info
  end
  it "correction should call get with :artist" do
    @artist.class.should_receive(:get).with('artist.getcorrection', {:artist => "Honeycut"},{})
    @artist.correction
  end
  it "events should call get with :artist" do
    @artist.class.should_receive(:get).with('artist.getevents', {:artist => "Honeycut"},{})
    @artist.events
  end
  it "past events should call get with :artist" do
    @artist.class.should_receive(:get).with('artist.getpastevents', {:artist => "Honeycut"},{})
    @artist.past_events
  end
  it "shouts should call get with :artist" do
    @artist.class.should_receive(:get).with('artist.getshouts',{:artist => "Honeycut"},{})
    @artist.shouts
  end
  it "similar should call get with :artist" do
    @artist.class.should_receive(:get).with('artist.getsimilar', {:artist => "Honeycut"},{})
    @artist.similar
  end
  it "top_albums should call get with :artist" do
    @artist.class.should_receive(:get).with('artist.gettopalbums', {:artist => "Honeycut"},{})
    @artist.top_albums
  end
  it "top_fans should call get with :artist" do
    @artist.class.should_receive(:get).with('artist.gettopfans', {:artist => "Honeycut"},{})
    @artist.top_fans
  end
  it "top_tags should call get with :artist" do
    @artist.class.should_receive(:get).with('artist.gettoptags', {:artist => "Honeycut"},{})
    @artist.top_tags
  end
  it "top_tracks should call get with :artist" do
    @artist.class.should_receive(:get).with('artist.gettoptracks', {:artist => "Honeycut"},{})
    @artist.top_tracks
  end
end
describe "Artist auth" do
  before(:each) do
    @artist = Scrobbler2::Artist.new(:artist => "Honeycut")
    @artist.class.stub!(:get_with_auth).and_return Hash.new
  end
  it "tags should call get_with_auth with :artist" do
    @artist.class.should_receive(:get_with_auth).with('artist.gettags', {:artist => "Honeycut"},{})
    @artist.tags
  end
end
describe "Artist Add/Remove Tags" do
  before(:each) do
    @artist = Scrobbler2::Artist.new(:artist => "Honeycut")
    @artist.class.stub!(:post_with_auth).and_return Hash.new
    @artist.stub!(:info).and_return(OpenStruct.new({:name=>'Honeycut'}))
  end
  it "add_tags should call post_with_auth with :artist and :tags" do
    @artist.class.should_receive(:post_with_auth).with('artist.addtags',{:artist=>'Honeycut',:tags=>'Electronic'})
    @artist.add_tags('Electronic')
  end
  it "remove_tags should call post_with_auth with :artist and :tags" do
    @artist.class.should_receive(:post_with_auth).with('artist.removetag',{:artist=>'Honeycut',:tag=>'Electronic'})
    @artist.remove_tag('Electronic')
  end

end

