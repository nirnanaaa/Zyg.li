class AddNameBioLastPostedAtPasswordHashSaltToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :bio, :text
    add_column :users, :last_posted_at, :datetime
    add_column :users, :password_hash, :string
    add_column :users, :salt, :string
  end
end
