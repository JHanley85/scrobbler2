require_relative '../spec_helper.rb'
$: << File.dirname(__FILE__) + "/../../../lib/"

describe "album information for 'The Day I Turned To Glass' by 'Honeycut'." do
  before(:all) do


      @file_path=File.dirname(__FILE__)
      @album=Scrobbler2::Album.new({:artist => 'Honeycut', :album => 'The Day I Turned To Glass'})

      @info_file="#{@file_path}/info.log"
      unless FileTest.exist?(@info_file)
        @info=@album.info
        @info_file=File.open(@info_file,"w+").write(@info.marshal_dump)
      end
      #@file="#{@file_path}/buylinks.log"
      #unless FileTest.exist?(@file)
      #  @buylinks=@album.buylinks
      #  @buylinks_file=File.open(@file,"w+")
      #  @buylinks_file.write(@buylinks)
      #end
      #@file="#{@file_path}/shouts.log"
      #unless FileTest.exist?(@file)
      #  @shouts=@album.shouts
      #  @shouts_file=File.open(@file,"w+").write(@shouts)
      #end
      #@file="#{@file_path}/tags.log"
      #unless FileTest.exist?(@file)
      #  @tags=@album.tags
      #  @tags_file=File.open(@file,"w+").write(@tags)
      #end
      #@file="#{@file_path}/top_tags.log"
      #unless FileTest.exist?(@file)
      #  @top_tags=@album.top_tags
      #  @top_tags_file=File.open(@file,"w+").write(@top_tags)
      #end
      @info=OpenStruct.new().marshal_load(File.read(@info_file))
     puts @info


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

