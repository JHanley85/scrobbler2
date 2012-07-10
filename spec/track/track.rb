require_relative '../spec_helper.rb'
$: << File.dirname(__FILE__) + "/../../../lib/"
describe "get current information for track ___" do
  before(:all) do
    wait 30 do
      @track=Scrobbler2::Track.new(ARTISTANDTRACK)
      @buylinks=@track.buylinks
      @correction =@track.correction
      @fingerprintmetadata=@track.fingerprint_metadata
      @info=@track.info
      @shouts=@track.shouts
      @similar=@track.similar
      @tags=@track.tags
      @topfans=@track.top_fans
      @toptags=@track.top_tags
    end
  end
  it "should return the following as OpenStruct" do
    @buylinks.should be_a_kind_of OpenStruct
    @correction.should be_a_kind_of OpenStruct
    @fingerprintmetadata.should be_a_kind_of OpenStruct
    @info.should be_a_kind_of OpenStruct
    @shouts.should be_a_kind_of OpenStruct
    @similar.should be_a_kind_of OpenStruct
    @tags.should be_a_kind_of OpenStruct
    @topfans.should be_a_kind_of OpenStruct
    @toptags.should be_a_kind_of OpenStruct
  end

end