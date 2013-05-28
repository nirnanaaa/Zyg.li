class AddSkypeWebsiteToUsers < ActiveRecord::Migration
  def change
    add_column :users, :skype, :string
    add_column :users, :website, :string
  end
end
