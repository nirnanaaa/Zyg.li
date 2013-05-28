class Group < ActiveRecord::Base

  has_many :group_members, dependent: :destroy
  has_many :users, through: :group_members

  # hardcode basic groups?


end
