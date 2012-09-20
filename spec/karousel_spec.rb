require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Karousel" do
  before(:all) do
    @karousel = Karousel.new(ClientJobDummy, 20, 0)
  end
  
  it "should initiate" do
    k = Karousel.new(ClientJobDummy, 20, 0)
    k.class.should == Karousel
  end

  it "should have size" do
    @karousel.size.should == 20
    @karousel.seats.size.should == 0
    @karousel.time_interval.should == 0
  end
  
  it "should run with block" do
    @karousel.run do
    end
  end

  it "should be able to get loaded with jobs" do 
    @karousel.seats.size.should == 0 
    @karousel.populate
    @karousel.seats.size.should == 20
    @karousel.seats[0].class == Karousel::Job
    @karousel.seats[0].status.should == :init
  end

  it "should run" do
    @karousel.run.should == true
  end

end
