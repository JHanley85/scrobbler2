require_relative '../spec_helper.rb'
$: << File.dirname(__FILE__) + "/../../../lib/"

describe "Chart information for the current date" do
  before(:all) do
    @chart=Scrobbler2::Chart.new
    @hypedartists=@chart.hyped_artists
    @hypedtracks=@chart.hyped_tracks
    @lovedartists=@chart.loved_artists
    @topartists=@chart.top_artists
    @toptags=@chart.top_tags
    @toptracks=@chart.top_tracks
  end
  it "should be OpenStruct" do
    @chart.should be_a_kind_of OpenStruct
    @hypedartists.should be_a_kind_of OpenStruct
    @hypedtracks.should be_a_kind_of OpenStruct
    @lovedartists.should be_a_kind_of OpenStruct
    @topartists.should be_a_kind_of OpenStruct
    @toptags.should be_a_kind_of OpenStruct
    @toptracks.should be_a_kind_of OpenStruct
  end
  it "should have the following as objects" do
    @lovedartists.track.first.should be_a_kind_of OpenStruct
    @lovedartists.track.first.streamable.should be_a_kind_of OpenStruct
    @lovedartists.track.first.artist.should be_a_kind_of OpenStruct

  end
  it "should have track information" do
    @lovedartists.track.first.name.should be_a_kind_of String
    @lovedartists.track.first.duration.should be_a_kind_of String
    @lovedartists.track.first.loves.should be_a_kind_of String
    @lovedartists.track.first.mbid.should be_a_kind_of String
    @lovedartists.track.first.url.should be_a_kind_of String
    @lovedartists.track.first.streamable.fulltrack.should be_between(0,1)
    @lovedartists.track.first.artist.mbid.should be_a_kind_of String
    @lovedartists.track.first.artist.name.should be_a_kind_of String
    @lovedartists.track.first.artist.url.should be_a_kind_of String
    @lovedartists.track.first.image.first.should be_a_kind_of OpenStruct
    @lovedartists.track.first.image.first.marshall_dump.to_hash[:"#text"].should be_a_kind_of String

  end
  it "should have integers for duration, loves" do
    @lovedartists.track.first.duration.to_i.should be_a_kind_of Fixnum #Should convert to i
    @lovedartists.track.first.loves.to_i.should be_a_kind_of Fixnum   #Should convert to i
  end
  it "should have valid url" do
    @lovedartists.track.first.url.include?("http://").should == true
    @lovedartists.track.first.artist.url.include?("http://").should == true
    @lovedartists.track.first.image.first.marshall_dump.to_hash[:"#text"].include?("http://").should == true


  end

end