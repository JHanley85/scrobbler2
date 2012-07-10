require_relative '../spec_helper.rb'
$: << File.dirname(__FILE__) + "/../../../lib/"
describe "libraries, non-auth" do
  before(:each) do
    @library= Scrobbler2::Library.new(:user=>'SJPollux') #LastFM is down, can't access real library id.'
    @library.class.stub!(:get).and_return Hash.new
  end
  it "should have a default query" do
    @library.instance_variable_get(:@query).should  =={:user=>'SJPollux'}
  end
  it "artists should call get with nil" do
    @library.class.should_receive(:get).with('library.getartists',{:user=>'SJPollux'},{})
    @library.artists
  end
  it "albums should call get with nil" do
    @library.class.should_receive(:get).with('library.gettoptracks',{:user=>'SJPollux'},{})
    @library.albums
  end
  it "tracks should call get with nil" do
    @library.class.should_receive(:get).with('library.gettopartists',{:user=>'SJPollux'},{})
    @library.tracks
  end
end

