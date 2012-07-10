require_relative '../spec_helper.rb'
$: << File.dirname(__FILE__) + "/../../../lib/"

describe "album information for 'The Day I Turned To Glass' by 'Honeycut'." do
  before(:all) do
    wait 30 do
      @album=Scrobbler2::Album.new({:artist=>'Honeycut',:album=>'The Day I Turned To Glass'})
      @info=@album.info
      @buylinks=@album.buylinks
      @shouts=@album.shouts
      @tags=@album.tags
      @toptags=@album.top_tags
    end
  end
  it "should be openstruct" do
    @info.should be_a_kind_of OpenStruct
    @buylinks.should be_a_kind_of OpenStruct
    @shouts.should be_a_kind_of OpenStruct
    @tags.should be_a_kind_of OpenStruct
    @toptags.should be_a_kind_of OpenStruct
  end
  it "should have valid url" do
    #pending
  end


end