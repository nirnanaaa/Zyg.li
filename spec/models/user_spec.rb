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

    it "should sanitize a totally strange username" do
      User.sanitize_username!("cr zy ^ GUY").should == "cr_zy_GUY"
    end

    it "should initialize a new user based off params" do
      #TODO
    end

  
  end

  describe "Instance methods" do
  
  end

end
