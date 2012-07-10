require_relative '../spec_helper.rb'
$: << File.dirname(__FILE__) + "/../../../lib/"
describe "Get event information for ____(To be filled out when servers are back up)" do

  before(:all) do
    wait 30 do
      @event=Scrobbler2::Event.new(EVENTID)
      @attendees=@event.attendees
      @info=@event.info
      @shouts=@event.shouts
    end
  end
  it "Should have the following as OpenStructs." do
    @attendees.should be_a_kind_of OpenStruct
    @info.should be_a_kind_of OpenStruct
    @shouts.should be_a_kind_of OpenStruct
  end

end
