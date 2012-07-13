require_relative '../spec_helper.rb'
$: << File.dirname(__FILE__) + "/../../../lib/"

describe "Album.buylinks" do
  before(:all) do
  @album=Scrobbler2::Album.new(:artist=>"Honeycut",:album=>"The Day I Turned To Glass",:country=>'United States')
  @buylinks=@album.buylinks
  end
  it "should have Physicals and Digitals" do
  @buylinks.physicals.should be_a_kind_of OpenStruct
  @buylinks.downloads.should be_a_kind_of OpenStruct
  end
  it "should have Amazon, Ebay for physicals" do
  @buylinks.physicals.affiliation[0].supplierName.should == "Amazon"
  @buylinks.physicals.affiliation[0].buyLink.should == "http://www.last.fm/affiliate/byid/8/3294984/1/ws.album.buylinks.c62652cbaabd91e0553c7b415c5a3dbc"
  @buylinks.physicals.affiliation[1].supplierName.should == "eBay"
  @buylinks.physicals.affiliation[1].buyLink.should == "http://www.last.fm/affiliate/byid/8/3294984/90/ws.album.buylinks.c62652cbaabd91e0553c7b415c5a3dbc"
  end

  it "should have Amazon MP3 7Digital, Juno, and Itunes for downloads" do
  @buylinks.downloads.affiliation[0].supplierName.should == "Amazon MP3"
  @buylinks.downloads.affiliation[0].price.currency.should == "USD"
  @buylinks.downloads.affiliation[0].price.amount.should == "8.99"
  @buylinks.downloads.affiliation[0].buyLink.should == "http://www.last.fm/affiliate/byid/8/3294984/44/ws.album.buylinks.c62652cbaabd91e0553c7b415c5a3dbc"
   @buylinks.downloads.affiliation[1].supplierName.should == "7digital"
  @buylinks.downloads.affiliation[1].price.currency.should == "USD"
  @buylinks.downloads.affiliation[1].price.amount.should == "9.99"
  @buylinks.downloads.affiliation[1].buyLink.should == "http://www.last.fm/affiliate/byid/8/3294984/13/ws.album.buylinks.c62652cbaabd91e0553c7b415c5a3dbc"
   @buylinks.downloads.affiliation[2].supplierName.should == "Juno"
  @buylinks.downloads.affiliation[2].price.currency.should == "USD"
  @buylinks.downloads.affiliation[2].price.amount.should == "10.99"
  @buylinks.downloads.affiliation[2].buyLink.should == "http://www.last.fm/affiliate/byid/8/3294984/128/ws.album.buylinks.c62652cbaabd91e0553c7b415c5a3dbc"
   @buylinks.downloads.affiliation[3].supplierName.should == "iTunes"
  @buylinks.downloads.affiliation[3].price.currency.should == "USD"
  @buylinks.downloads.affiliation[3].price.amount.should == "9.99"
  @buylinks.downloads.affiliation[3].buyLink.should == "http://www.last.fm/affiliate/byid/8/3294984/24/ws.album.buylinks.c62652cbaabd91e0553c7b415c5a3dbc"
    end
end