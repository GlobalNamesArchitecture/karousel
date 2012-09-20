require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Karousel" do
  before(:all) do
    @karousel = Karousel.new(ClientJobDummy, 20, 0)
  end

  before(:each) do
    ClientJobDummy.reset
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
    karousel = Karousel.new(ClientJobDummy, 20, 0)
    karousel.run do
      karousel.cycle_data.size.should > 0
      statuses = karousel.cycle_data.map {|c| c.status}.uniq!
      [:failure, :success].should == statuses.sort! if statuses.size > 1
    end
  end

  it "should be able to get loaded with jobs" do 
    @karousel.seats.size.should == 0 
    @karousel.populate
    @karousel.seats.size.should == 20
    @karousel.seats[0].class == Karousel::Job
    @karousel.seats[0].status.should == :init
  end

end
