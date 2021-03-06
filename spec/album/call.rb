require_relative '../spec_helper.rb'
$: << File.dirname(__FILE__) + "/../../../lib/"
describe "album, non-auth" do
  before(:each) do
    @album = Scrobbler2::Album.new({:album=>"The Day I Turned To Glass",:artist => "Honeycut"})
    @album.class.stub!(:get).and_return Hash.new
  end
  it "should have a default query" do
    @album.instance_variable_get(:@query).should =={:album=>"The Day I Turned To Glass",:artist => "Honeycut"}
  end
  it "info should call get with :album" do
    @album.class.should_receive(:get).with('album.getinfo',{:album =>"The Day I Turned To Glass",:artist => "Honeycut"},{})
    @album.info
  end
  it "shouts should call get with :artist" do
    @album.class.should_receive(:get).with('album.getshouts',{:album =>"The Day I Turned To Glass",:artist => "Honeycut"},{})
    @album.shouts
  end
  it "top_tags should call get with :album" do
    @album.class.should_receive(:get).with('album.gettoptags', {:album =>"The Day I Turned To Glass",:artist => "Honeycut"},{})
    @album.top_tags
  end
end
describe "album auth" do
  before(:each) do
    @album = Scrobbler2::Album.new(:album =>"The Day I Turned To Glass",:artist => "Honeycut")
    @album.class.stub!(:get_with_auth).and_return Hash.new
  end
  it "tags should call get_with_auth with :album" do
    @album.class.should_receive(:get_with_auth).with('album.gettags', {:album =>"The Day I Turned To Glass",:artist => "Honeycut"},{})
    @album.tags
  end
end
describe "album Add/Remove Tags" do
  before(:each) do
    @album = Scrobbler2::Album.new(:album => "Honeycut",:artist => "Honeycut")
    @album.class.stub!(:post_with_auth).and_return Hash.new
    @album.stub!(:info).and_return(OpenStruct.new({:name=>'The Day I Turned To Glass',:artist=>'Honeycut'}))
  end
  it "add_tags should call post_with_auth with :album and :tags" do
    @album.class.should_receive(:post_with_auth).with('album.addtags',{:album=>"The Day I Turned To Glass",:artist =>'Honeycut',:tags=>'Electronic'})
    @album.add_tags('Electronic')
  end
  it "remove_tags should call post_with_auth with :album and :tags" do
    @album.class.should_receive(:post_with_auth).with('album.removetag',{:album=>"The Day I Turned To Glass",:artist =>'Honeycut',:tag=>'Electronic'})
    @album.remove_tag('Electronic')
  end

end
describe "Album sharing of Honeycut's The Day I turned to Glass, with '" do
end

