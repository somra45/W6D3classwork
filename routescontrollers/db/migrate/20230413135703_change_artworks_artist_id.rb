class ChangeArtworksArtistId < ActiveRecord::Migration[7.0]
  def change
    remove_index :artworks, :artist_id
    add_index :artworks, :artist_id, unique: true
  end
end
