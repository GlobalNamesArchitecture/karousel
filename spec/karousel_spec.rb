require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Karousel" do
  before(:all) do
  end
  
  it "should initiate" do
    k = Karousel.new(JobDummy, 20, 0)
    k.class.should == Karousel
  end
end
