class CreateGroupMembers < ActiveRecord::Migration
  def change
    create_table :group_members do |t|
      t.integer :group_id
      t.integer :user_id
    end
    add_index :group_members, [:group_id, :user_id], :unique => true, :name => 'index_group_members_on_group_id_and_user_id'
  end
end
