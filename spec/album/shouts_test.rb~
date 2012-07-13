require_relative '../spec_helper.rb'
$: << File.dirname(__FILE__) + "/../../../lib/"

describe "Album.info" do
  before(:all) do
  @shouts=Scrobbler2::Album.new(:artist=>"Honeycut",:album=>"The Day I Turned To Glass").shouts
  end
  it "should have a body, date and author" do
  @shouts.shout.body.should == "One scrobble every whopping 13 minutes and 6.133 seconds. That's roughly 30% of the length of the entire album."
  @shouts.shout.author.should == "BlockJuice"
  @shouts.shout.date.should == "Thu, 17 Mar 2011 01:51:42"
  end
end
