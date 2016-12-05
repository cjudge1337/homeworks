class ChangeNameColumn < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.rename :named, :name
    end
  end
end
