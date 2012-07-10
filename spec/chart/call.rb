require_relative '../spec_helper.rb'
$: << File.dirname(__FILE__) + "/../../../lib/"
describe "chart, non-auth" do
  before(:each) do
    @chart= Scrobbler2::Chart.new
    @chart.class.stub!(:get).and_return Hash.new
  end
  it "should not have a default query" do
    @chart.instance_variable_get(:@query).should be_nil
  end
  it "hyped_artists should call get with nil" do
    @chart.class.should_receive(:get).with('chart.gethypedartists',{},{})
    @chart.hyped_artists
  end
  it "hyped_tracks should call get with nil" do
    @chart.class.should_receive(:get).with('chart.gethypedtracks',{},{})
    @chart.hyped_tracks
  end
  it "loved_tracks should call get with nil" do
    @chart.class.should_receive(:get).with('chart.getlovedtracks',{},{})
    @chart.loved_tracks
  end
  it "top_artists should call get with nil" do
    @chart.class.should_receive(:get).with('chart.gettopartists',{},{})
    @chart.top_artists
  end
  it "top_tags should call get with nil" do
    @chart.class.should_receive(:get).with('chart.gettoptags',{},{})
    @chart.top_tags
  end
  it "top_tracks should call get with nil" do
    @chart.class.should_receive(:get).with('chart.gettoptracks',{},{})
    @chart.top_tracks
  end

end