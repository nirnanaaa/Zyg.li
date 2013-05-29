# == Schema Information
#
# Table name: group_members
#
#  id       :integer          not null, primary key
#  group_id :integer
#  user_id  :integer
#
# Indexes
#
#  index_group_members_on_group_id_and_user_id  (group_id,user_id) UNIQUE
#

class GroupMembers < ActiveRecord::Base
  belongs_to :group, counter_cache: "user_count"
  belongs_to :user
end
