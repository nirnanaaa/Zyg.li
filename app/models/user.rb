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

  validates :username_validator
  validates :password_validator

  scope :admins, -> { where(is_admin: true) }
  scope :mods, ->   { where(is_moderator: true) }
  scope :staff, ->  { where("is_moderator = 'true' or is_admin = 'true'") }


  
  protected


end
