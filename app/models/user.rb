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

class User < ActiveRecord::Base

  #has_many :user_characters, dependent: :destroy
  #has_many :characters, through: :user_characters
  has_many :group_members
  has_many :groups, through: :group_members

  belongs_to :approved_by, class_name: 'User'

  before_save :update_username_lower
  before_save :ensure_password_is_hashed
  #after_initialize :add_guild_rank
  #
  after_create :create_email_token
  after_create :confirm_user

  validate :username_validator
  validate :password_validator

  scope :admins, -> { where(is_admin: true) }
  scope :mods, ->   { where(is_moderator: true) }
  scope :offis, ->  { where("is_moderator = 'true' or is_admin = 'true'") }

  class << self
    def username_range
      3..15    
    end
    
    def sanitize_username!(name)
      name.gsub!(/^[^[:alnum:]]+|\W+$/, "")
      name.gsub!(/\W+/, "_")
    end

    def rightsize_username(name)
      name.ljust(username_length.begin, '1')[0,username_length.end]
    end

    def new_from_params(params)
      user = User.new
      user.name = params[:name]
      user.email = params[:email]
      user.password = params[:password]
      user.username = params[:username]
      user
    end
  end

  protected

  def username_validator
  end
  def password_validator
  end
  def create_email_token
  end
  def confirm_user
  end
  def update_username_lower
  end
  def ensure_password_is_hashed
  end
  



end
