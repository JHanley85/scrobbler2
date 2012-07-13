require_relative '../spec_helper.rb'
$: << File.dirname(__FILE__) + "/../../../lib/"

describe "Album.tags" do
  before(:all) do
    @tags_post=Scrobbler2::Album.new(:artist=>"Honeycut",:album=>"The Day I Turned To Glass", :user=>"SJPollux")
    @tags=Scrobbler2::Album.new(:artist=>"Honeycut",:album=>"The Day I Turned To Glass", :user=>"SJPollux")
    end

  it "should display \n in text (no shouts) initally" do
    @tags.tags.text.should == "\n"
    @tags.tags.artist.should == "Honeycut"
    @tags.tags.album.should == "The Day I Turned To Glass"
    end
  it "should be able to post single tags as a user" do
  @tags_post.add_tags('Electronic')
  @tags=Scrobbler2::Album.new(:artist=>"Honeycut",:album=>"The Day I Turned To Glass", :user=>"SJPollux")
  @tags.tags.tag.name.should == 'electronic'
  end
  it "should be able to remove single tags as user" do
  @tags_post.remove_tag('Electronic')
  end
  it "should be able to post multiple tags as a user" do
  @tags_post.add_tags('Electronic, Soul')
  @tags_post.remove_tag('Electronic')
  @tags_post.remove_tag('Soul')
  end

end
