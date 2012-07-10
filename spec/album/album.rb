require_relative '../spec_helper.rb'
$: << File.dirname(__FILE__) + "/../../../lib/"

describe "album information for 'The Day I Turned To Glass' by 'Honeycut'." do
  before(:all) do
    wait 30 do
      @album=Scrobbler2::Album.new({:artist => 'Honeycut', :album => 'The Day I Turned To Glass'})
      @info=@album.info
      @buylinks=@album.buylinks
      @shouts=@album.shouts
      @tags=@album.tags
      @toptags=@album.top_tags
    end
  end
  it "should be openstruct" do
    @info.should be_a_kind_of OpenStruct
    @buylinks.should be_a_kind_of OpenStruct
    @shouts.should be_a_kind_of OpenStruct
    @tags.should be_a_kind_of OpenStruct
    @toptags.should be_a_kind_of OpenStruct
  end
  it "should have valid url" do
    #pending
  end

end

describe "Album" do
  before(:each) do
    @album = Scrobbler2::Album.new(:artist => "Honeycut", :album => "The Day I Turned To Glass")
    @album.class.stub!(:get).and_return Hash.new
  end

  it "should have a default query" do
    @album.instance_variable_get(:@query).should =={:artist => "Honeycut", :album => "The Day I Turned To Glass"}
  end
  it "info should call get with :artist, :album" do
    @album.class.should_receive(:get).with('album.getinfo', :artist => "Honeycut", :album => "The Day I Turned To Glass")
    @album.info
  end
  it "buylinks should call get with :artist, :album" do
    @album.class.should_receive(:get).with('album.getbuylinks', :artist => "Honeycut", :album => "The Day I Turned To Glass")
    @album.buylinks
  end
  it "shouts should call get with :artist, :album" do
    @album.class.should_receive(:get).with('album.getshouts', :artist => "Honeycut", :album => "The Day I Turned To Glass")
    @album.shouts
  end
  it "tags should call get with :artist, :album" do
    @album.class.should_receive(:get).with('album.gettags', :artist => "Honeycut", :album => "The Day I Turned To Glass")
    @album.tags
  end
  it "top tags should call get with :artist, :album" do
    @album.class.should_receive(:get).with('album.gettoptags', :artist => "Honeycut", :album => "The Day I Turned To Glass")
    @album.top_tags
  end
end