class CreateSubs < ActiveRecord::Migration
  def change
    create_table :subs do |t|
      t.string :title, null: false, index: true
      t.text :description, null: false
      t.integer :user_id, null: false, index: true

      t.timestamps null: false
    end

    remove_index :users, :username
    add_index :users, :username, unique: true
  end
end
