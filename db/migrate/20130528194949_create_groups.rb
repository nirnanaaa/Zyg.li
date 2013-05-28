class CreateGroups < ActiveRecord::Migration
  def up
    create_table :groups do |t|
      t.boolean :automatic,   default: false, null: false
      t.string  :name,        null: false
      t.integer :user_count,  default: 0, null: false
      
      t.timestamps
    end

      execute <<SQL
      ALTER SEQUENCE groups_id_seq START WITH 100
SQL
  end
  def down
    remove_column :groups, :automatic
  end
end
