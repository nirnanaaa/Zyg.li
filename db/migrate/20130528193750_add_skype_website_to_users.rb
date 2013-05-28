class AddSkypeWebsiteToUsers < ActiveRecord::Migration
  def up
    add_column :users, :skype, :string
    add_column :users, :website, :string
    execute("UPDATE users SET website = '#{Rails.configuration.default_website}'")
  end

  def down
    remove_column :users, :skype
    remove_column :users, :website
  end
end
