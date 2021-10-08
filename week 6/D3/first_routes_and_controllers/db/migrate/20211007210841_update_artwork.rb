class UpdateArtwork < ActiveRecord::Migration[5.2]
  def change
    add_index :artworks, [:title, :artist_id]
    # can only check uniqueness if indexed
  end
end
