require 'spec_helper'

describe User do
  
  describe "Relations" do
  
  end

  describe "Validations" do
    
  
  end

  describe "Class methods" do
    it "should test the username range" do
      User.username_range.begin.should == 3
      User.username_range.end.should == 15
    end
  
  end

  describe "Instance methods" do
  
  end

end
