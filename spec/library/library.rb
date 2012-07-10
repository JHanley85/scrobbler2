require_relative '../spec_helper.rb'
$: << File.dirname(__FILE__) + "/../../../lib/"
describe "Get library information for user ____(To be filled out when servers are back up)" do

  before(:all) do
    wait 30 do
      @library=Scrobbler2::Event.new(USER)
      @artists=@library.artists
      @albums=@library.albums
      @tracks=@library.tracks
    end
  end
  it "Should have the following as OpenStructs." do
    @library.should be_a_kind_of OpenStruct
    @albums.should be_a_kind_of OpenStruct
    @tracks.should be_a_kind_of OpenStruct
  end

end
