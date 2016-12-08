class ChangeAllTablesAgainAgain < ActiveRecord::Migration
  def change
    drop_table :bands
    drop_table :albums
    drop_table :tracks

    create_table :bands do |t|
      t.string :name, null: false

      t.timestamps
    end

    add_index :bands, :name

    create_table :albums do |t|
      t.string :name, null: false
      t.string :recording, null: false
      t.integer :band_id, null: false

      t.timestamps
    end

    add_index :albums, :band_id

    create_table :tracks do |t|
      t.string :name, null: false
      t.string :kind, null: false
      t.integer :album_id, null: false

      t.timestamps
    end

    add_index :tracks, :album_id
  end
end
