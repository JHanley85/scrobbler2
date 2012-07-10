require_relative '../spec_helper.rb'
$: << File.dirname(__FILE__) + "/../../../lib/"

describe "Get playlist information for ____(To be filled out when servers are back up)" do

  before(:all) do
    wait 30 do
      @playlist=Scrobbler2::Playlist.new(PLAYLISTURL)
    end
  end
  it "Should have the following Openstructs" do
    @playlist.should be_a_kind_of OpenStruct
  end



end
