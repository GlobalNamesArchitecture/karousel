require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Karousel::Job do

  it "intstantiate" do 
    j = Karousel::Job.new(ClientJobDummy)
    j.class.should == Karousel::Job
  end
end

