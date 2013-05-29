# == Schema Information
#
# Table name: groups
#
#  id         :integer          not null, primary key
#  automatic  :boolean          default(FALSE), not null
#  name       :string(255)      not null
#  user_count :integer          default(0), not null
#  created_at :datetime
#  updated_at :datetime
#

class Group < ActiveRecord::Base

  has_many :group_members, dependent: :destroy
  has_many :users, through: :group_members

  # hardcode basic groups?


end
