# == Schema Information
#
# Table name: users
#
#  id               :integer          not null, primary key
#  username         :string(255)
#  created_at       :datetime
#  updated_at       :datetime
#  name             :string(255)
#  bio              :text
#  last_posted_at   :datetime
#  password_hash    :string(255)
#  salt             :string(255)
#  is_admin         :boolean
#  is_moderator     :boolean
#  skype            :string(255)
#  website          :string(255)
#  display_username :string(255)
#  username_lower   :string(20)       not null
#  banned_at        :datetime
#  banned_till      :datetime
#  is_active        :boolean
#
# Indexes
#
#  index_users_on_username        (username) UNIQUE
#  index_users_on_username_lower  (username_lower) UNIQUE
#

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
