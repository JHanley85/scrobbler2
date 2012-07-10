require_relative '../spec_helper.rb'
$: << File.dirname(__FILE__) + "/../../../lib/"

describe "Artist information for 4c5157ad-7832-4aec-9412-97aaa1a08ba6 (Honeycut)" do
	before(:all) do
		wait 30 do
			@name      =Scrobbler2::Artist.new(:artist => "Honeycut")
			#@correction=@name.correction
			@events    =@name.events
			@info      =@name.info
			@pastevents=@name.past_events
			@shouts    =@name.shouts
			@similar   =@name.similar
			@tags      =@name.tags
			@topalbums =@name.top_albums
			@topfans   =@name.top_fans
			@toptracks =@name.top_tracks
		end
	end
	it "should be openstruct" do
		@events.should be_a_kind_of OpenStruct
		@info.should be_a_kind_of OpenStruct
		@pastevents.should be_a_kind_of OpenStruct
		@shouts.should be_a_kind_of OpenStruct
		@similar.should be_a_kind_of OpenStruct
		@tags.should be_a_kind_of OpenStruct
		@topalbums.should be_a_kind_of OpenStruct
		@topfans.should be_a_kind_of OpenStruct
		@toptracks.should be_a_kind_of OpenStruct

	end
	it "should have current events" do
		if @events.attr.nil? #Check for 'not touring'
			@events.total.should == "0"
			@events.page.should =="0"
			@events.perPage.should == "50"
			@events.totalPages.should =="0"
			@events.festivalsonly.should =="0"
			@events.totalPages.should =="0"
			@events.event.should be_nil
		else
			@events.attr.total.should == @events.event.count
		end

	end
	it "should be able to post and remove tags" do
		if @name.tags.nil?
			@name.add_tags('electronic')
			@name=Scrobbler2::Artist.new(:artist => "Honeycut")
			@name.tags.tag.name.should == 'electronic'
			@name.remove_tag('electronic')
			@name=Scrobbler2::Artist.new(:artist => "Honeycut")
			@name.tags.tag.should== nil
		end
	end
end

