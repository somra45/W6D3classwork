class CreateArtworks < ActiveRecord::Migration[7.0]
  def change
    create_table :artworks do |t|
      t.text :title, null: false
      t.text :image_url, null: false
      t.integer :artist_id, null: false
      t.timestamps
    end

    add_index :artworks, :artist_id
    add_foreign_key :artworks, :users, column: :artist_id

  end
end
