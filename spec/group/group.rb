require_relative '../spec_helper.rb'
$: << File.dirname(__FILE__) + "/../../../lib/"

describe "Get group information for ____(To be filled out when servers are back up)" do

  before(:all) do
    wait 30 do
      @group=Scrobbler2::Event.new(GROUPNAME)
      @hype=@group.hype
      @members=@group.members
      @weeklyalbumchart=@group.weekly_album_chart
      @weeklyartistchart=@group.weekly_artist_chart
      @weeklychartlist=@group.weekly_chart_list
      @weeklytrackchart=@group.weekly_track_chart

    end
  end
  it "Should have the following as OpenStructs." do
    @hype.should be_a_kind_of OpenStruct
    @members.should be_a_kind_of OpenStruct
    @weeklyalbumchart.should be_a_kind_of OpenStruct
    @weeklyartistchart.should be_a_kind_of OpenStruct
    @weeklychartlist.should be_a_kind_of OpenStruct
    @weeklytrackchart.should be_a_kind_of OpenStruct
  end

end
