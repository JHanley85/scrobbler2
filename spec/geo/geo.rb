require_relative '../spec_helper.rb'
$: << File.dirname(__FILE__) + "/../../../lib/"

describe "events for san francisco" do

	before(:all) do #We only want to hit the webservice once.
		wait 30 do
			@geo    = Scrobbler2::Geo.new(:location => "San Francisco", :page => 2, :limit => 10)
			@events = @geo.events
			@country = Scrobbler2::Geo.new(:location => "San Francisco",:country=>'United States', :page => 2, :limit => 10)
			@topartists = @country.top_artists
			@toptracks = @country.top_tracks
			@metro = Scrobbler2::Geo.new(:location => "San Francisco",:metro=>'San Francisco', :country=>'United States')
			@metroartistchart = @metro.metro_artist_chart
			@metrohypeartistchart = @metro.metro_hype_artist_chart
			@metrohypetrackchart = @metro.metro_hype_track_chart
			@metrotrackchart = @metro.metro_track_chart
			@metrouniqueartistchart = @metro.metro_unique_artist_chart
			@metrouniquetrackchart = @metro.metro_unique_track_chart
			@metroweeklychartlist = @metro.metro_weekly_chartlist
			@metros = @metro.metros
		end
	end

	it "should be openstruct" do
		@events.should be_a_kind_of OpenStruct
		@topartists.should be_a_kind_of OpenStruct
		@toptracks.should be_a_kind_of OpenStruct
		@metroartistchart.should be_a_kind_of OpenStruct
		@metrohypeartistchart.should be_a_kind_of OpenStruct
		@metrohypetrackchart.should be_a_kind_of OpenStruct
		@metrotrackchart.should be_a_kind_of OpenStruct
		@metrouniqueartistchart.should be_a_kind_of OpenStruct
		@metrouniquetrackchart.should be_a_kind_of OpenStruct
		@metroweeklychartlist.should be_a_kind_of OpenStruct
		@metros.should be_a_kind_of OpenStruct
	end
	it "should contain 10 entries" do
		@events.event.count.should equal 10
	end
	it "should be on the second page" do
		@events.attr.page.to_i.should == 2
	end
	it "should be querying 'San Francisco, United States'" do
		@events.attr.location.should =='San Francisco, United States'
	end
	it "should not be querying festivals only" do
		@events.attr.festivalsonly.to_i.should == 0
	end

	it "should have an event that has an id, title and artist and venue hash" do
		@events.event.first.id.should be_a_kind_of String
		@events.event.first.title.should be_a_kind_of String
		@events.event.first.artists.should be_a_kind_of OpenStruct
		@events.event.first.venue.should be_a_kind_of OpenStruct
	end
end
