require_relative '../spec_helper.rb'
$: << File.dirname(__FILE__) + "/../../../lib/"

describe "album information for 'The Day I Turned To Glass' by 'Honeycut'." do
  before(:all) do
    @file_path=File.dirname(__FILE__)
    @album=Scrobbler2::Album.new({:artist => 'Honeycut', :album => 'The Day I Turned To Glass',:country=>'United States', :user=>'SJPollux'})
    @file="#{@file_path}/info.log"
    @info=@album.info
    @info_file=File.open(@file,"w+").write(@info)
    @file="#{@file_path}/buylinks.log"
    @buylinks=@album.buylinks
    @buylinks_file=File.open(@file,"w+").write(@buylinks)
    @file="#{@file_path}/shouts.log"
    @shouts=@album.shouts
    @shouts_file=File.open(@file,"w+").write(@shouts)
    @file="#{@file_path}/tags.log"
    @tags=@album.tags
    @tags_file=File.open(@file,"w+").write(@tags)
    @file="#{@file_path}/top_tags.log"
    @toptags=@album.top_tags
    @top_tags_file=File.open(@file,"w+").write(@toptags)
  end

  it "should be openstruct" do
    @info.should be_a_kind_of OpenStruct
    @buylinks.should be_a_kind_of OpenStruct
    @shouts.should be_a_kind_of OpenStruct
    @tags.should be_a_kind_of OpenStruct
    @toptags.should be_a_kind_of OpenStruct
  end


end
