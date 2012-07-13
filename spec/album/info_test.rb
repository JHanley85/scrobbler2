require_relative '../spec_helper.rb'
$: << File.dirname(__FILE__) + "/../../../lib/"

describe "Album.info" do
  before(:all) do
  @album=Scrobbler2::Album.new(:artist=>"Honeycut",:album=>"The Day I Turned To Glass")
  @info=@album.info
  end

  it "should have 'Honeycut' as Artist" do
  @info.artist.should == "Honeycut"
  end

  it "should have 'The Day I Turned To Glass' as .album" do
  @info.name.should == "The Day I Turned To Glass"
  end

  it "should have an id for Artist" do
  @info.id.should == "3294984"
  end

  it "should have an mbid (a91c7de6-0530-4d23-897c-80c02341b328) for the album" do
  @info.mbid.should == "a91c7de6-0530-4d23-897c-80c02341b328"
  end

  it "should have images" do
    @info.image.should be_a_kind_of Array
    @info.image[0].should be_a_kind_of OpenStruct
    @info.image[0].text.should == "http://userserve-ak.last.fm/serve/34s/33131491.jpg"
    @info.image[0].size.should == "small"
  end

  it "should have 13777 listeners" do
    @info.listeners.to_i.should >= 10000 #To be safe, without being literal 13782
  end

  it "should have the following tracks" do
    @info.tracks.track[0].name.should == "The Day I Turned To Glass"
    @info.tracks.track[1].name.should == "Tough Kid"
    @info.tracks.track[2].name.should == "Shadows"
    @info.tracks.track[3].name.should == "Butter Room"
    @info.tracks.track[4].name.should == "Dysfunctional"
    @info.tracks.track[5].name.should == "Dark Days, White Lines"
    @info.tracks.track[6].name.should == "Polaroid Lullaby"
    @info.tracks.track[7].name.should == "Silky"
    @info.tracks.track[8].name.should == "Aluminum City"
    @info.tracks.track[9].name.should == "Crowded Avenue"
    @info.tracks.track[10].name.should == "Exodus Honey"
    @info.tracks.track[11].name.should == "Fallen To Greed"
  end
  it "should have Honeycut as the artist for each track" do
   @info.tracks.track.each do |t|
     t.artist.name.should == "Honeycut"
     t.artist.mbid.should == "4c5157ad-7832-4aec-9412-97aaa1a08ba6"
     t.artist.url.should == "http://www.last.fm/music/Honeycut"
   end
  end
  it "should have a rank for each track" do
    @info.tracks.track.each_with_index do |t,i|
      t.attr.rank.to_i.should == i+1
    end
  end
  it "should have tags" do
    @info.toptags.tag[0].name.should =="soul"
    @info.toptags.tag[0].url.should == "http://www.last.fm/tag/soul"
    @info.toptags.tag[1].name.should =="electronic"
    @info.toptags.tag[1].url.should=="http://www.last.fm/tag/electronic"
  end

end
