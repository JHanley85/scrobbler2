require_relative '../spec_helper.rb'
$: << File.dirname(__FILE__) + "/../../../lib/"

describe "Album.share" do
  before(:all) do
    @album=Scrobbler2::Album.new(:artist=>"Honeycut", :album=>"The Day I Turned To Glass",:user=>"SJPollux")
  end
  it "should share Honeycut The Day I Turned To Glass from SJPollux to SJPollux" do
    @album.share('SJPollux', :message=>"This is only a test.")
  end

end
