require_relative '../spec_helper.rb'
$: << File.dirname(__FILE__) + "/../../../lib/"
describe "events, non-auth" do
  before(:each) do
    @event= Scrobbler2::Event.new(:event=>0001) #LastFM is down, can't access real event id.'
    @event.class.stub!(:get).and_return Hash.new
  end
  it "should have a default query" do
    @event.instance_variable_get(:@query).should  =={:event=>001}
  end
  it "attendees should call get with nil" do
    @event.class.should_receive(:get).with('event.getattendees',{:event=>001},{})
    @event.attendees
  end
  it "info should call get with nil" do
    @event.class.should_receive(:get).with('event.getinfo',{:event=>001},{})
    @event.info
  end
  it "shouts should call get with nil" do
    @event.class.should_receive(:get).with('event.getshouts',{:event=>001},{})
    @event.shouts
  end
end

