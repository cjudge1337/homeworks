class ChangeUsers < ActiveRecord::Migration
  def change
    drop_table :users

    create_table :users do |t|
      t.string :username, null: false, unique: true
    end

    add_index :users, :username
  end
end
