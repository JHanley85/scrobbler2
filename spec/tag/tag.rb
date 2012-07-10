require_relative '../spec_helper.rb'
$: << File.dirname(__FILE__) + "/../../../lib/"
describe "get current information on tag:" do
  before(:all) do
     wait 30 do
       @tag=Scrobbler2::Tag.new(TAG)
       @info=@tag.info
       @similar=@tag.similar
       @topalbums=@tag.top_albums
       @topartists=@tag.top_artists
       @toptags=@tag.top_tags
       @toptracks=@tag.top_tracks
       @weeklyartistchart=@tag.weekly_artist_chart
       @weeklychartlist=@tag.weekly_chart_list
     end
  end
  it "should return the following as OpenStruct" do
    @info.should be_a_kind_of OpenStruct
    @similar.should be_a_kind_of OpenStruct
    @topalbums.should be_a_kind_of OpenStruct
    @topartists.should be_a_kind_of OpenStruct
    @toptags.should be_a_kind_of OpenStruct
    @toptracks.should be_a_kind_of OpenStruct
    @weeklyartistchart.should be_a_kind_of OpenStruct
    @weeklychartlist.should be_a_kind_of OpenStruct
  end


end