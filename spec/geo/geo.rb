$: << File.dirname(__FILE__) + "/../../../lib/"

describe "events for san francisco" do

	before(:all) do #We only want to hit the webservice once.
		@geo = Scrobbler2::Geo.new(:location => "San Francisco",:page=>2,:limit=>10)
		@events = @geo.events
	end

	it "should be hash" do
		@events.should be_a_kind_of Hash
	end
	it "should contain 10 entries" do
		@events['event'].count.should equal 10
	end
	it "should be on the second page" do
		@events['@attr']['page'].to_i.should == 2
	end
	it "should be querying 'San Francisco, United States'" do
		@events['@attr']['location'].should =='San Francisco, United States'
	end
	it "should not be querying festivals only" do
		@events['@attr']['festivalsonly'].to_i.should == 0
	end


end
