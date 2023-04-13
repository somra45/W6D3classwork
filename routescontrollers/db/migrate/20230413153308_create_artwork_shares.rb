class CreateArtworkShares < ActiveRecord::Migration[7.0]
  def change
    create_table :artwork_shares do |t|
      t.integer :artwork_id, null:false
      t.integer :viewer_id, null:false
      t.timestamps
    end
    add_index :artwork_shares, :artwork_id
    add_index :artwork_shares, :viewer_id
    add_index :artwork_shares, [:artwork_id,:viewer_id],unique: true

    add_foreign_key :artwork_shares, :artworks, column: :artwork_id
    add_foreign_key :artwork_shares, :users, column: :viewer_id
  end
end
