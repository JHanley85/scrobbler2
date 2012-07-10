require_relative '../spec_helper.rb'
$: << File.dirname(__FILE__) + "/../../../lib/"

describe "Get information for ____" do
  before(:all) do
    wait 30 do
      @venue=Scrobbler2::Venue.new(VENUEID)
      @events=@venue.events
      @pastevents= @venue.past_events
    end
  end
  it "Should have the following as OpenStructs" do
    @events.should be_a_kind_of OpenStruct
    @pastevents.should be_a_kind_of OpenStruct
  end

end
