class CreateAuthorColumn < ActiveRecord::Migration
  def change
    add_column :posts, :user_id, :integer, null: false, index: true
  end
end
