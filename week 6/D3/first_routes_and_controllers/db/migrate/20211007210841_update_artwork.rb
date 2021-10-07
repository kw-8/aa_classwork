class UpdateArtwork < ActiveRecord::Migration[5.2]
  def change
    add_index :artworks, [:title, :artist_id]
  end
end
