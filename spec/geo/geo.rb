require_relative '../spec_helper.rb'
$: << File.dirname(__FILE__) + "/../../../lib/"

describe "events for san francisco" do

	before(:all) do #We only want to hit the webservice once.
		wait 30 do
			@geo    = Scrobbler2::Geo.new(:location => "San Francisco", :page => 2, :limit => 10)
			@events = @geo.events
			@topartists = @geo.top_artists
			@toptracks = @geo.top_tracks
			@metroartistchart = @geo.metro_artist_chart
			@metrohypeartistchart = @geo.metro_hype_artist_chart
			@metrohypetrackchart = @geo.metro_hype_track_chart
			@metrotrackchart = @geo.metro_track_chart
			@metrouniqueartistchart = @geo.metro_unique_artist_chart
			@metrouniquetrackchart = @geo.metro_unique_track_chart
			@metroweeklychartlist = @geo.metro_weekly_chartlist
			@metros = @geo.metros
		end
	end

	it "should be hash" do
		@events.should be_a_kind_of Hash
		@topartists.should be_a_kind_of Hash
		@toptracks.should be_a_kind_of Hash
		@metroartistchart.should be_a_kind_of Hash
		@metrohypeartistchart.should be_a_kind_of Hash
		@metrohypetrackchart.should be_a_kind_of Hash
		@metrotrackchart.should be_a_kind_of Hash
		@metrouniqueartistchart.should be_a_kind_of Hash
		@metrouniquetrackchart.should be_a_kind_of Hash
		@metroweeklychartlist.should be_a_kind_of Hash
		@metros.should be_a_kind_of Hash
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
		@events.event.first.should have_key('id')
		@events.event.first.should have_key('title')
		@events.event.first.should have_key('artists')
		@events.event.first.should have_key('id')
		@events.event.first.should have_key('venue')
		@events.event.first.venue.should be_a_kind_of Hash
	end
end
