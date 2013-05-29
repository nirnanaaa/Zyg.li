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

require 'spec_helper'

describe GroupMembers do
  pending "add some examples to (or delete) #{__FILE__}"
end
