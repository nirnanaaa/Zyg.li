class AddSkypeWebsiteToUsers < ActiveRecord::Migration
  def change
    add_column :users, :skype, :string
    add_column :users, :website, :string
    execute("UPDATE users SET website = '#{Rails.configuration.default_website}'")
  end
end
