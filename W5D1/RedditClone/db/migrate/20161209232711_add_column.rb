class AddColumn < ActiveRecord::Migration
  def change
    add_column :posts, :user_id, :integer
    remove_column :posts, :sub_id
  end
end
