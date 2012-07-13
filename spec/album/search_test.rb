require_relative '../spec_helper.rb'
$: << File.dirname(__FILE__) + "/../../../lib/"

describe "Album.search" do

  before(:all) do
  @album=Scrobbler2::Album.search(:album=>"The Day I Turned To Glass")
  end
  it "should return Honeycut" do
  @album.parsed_response["results"]["albummatches"]["album"]["artist"].should == "Honeycut"
  end
end
