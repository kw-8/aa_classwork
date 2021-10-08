class User < ApplicationRecord
    validates :username, presence: true, uniqueness: true

    has_many :artworks,
      class_name: 'Artwork',
      foreign_key: :artist_id,
      primary_key: :id,
      dependent: :destroy 

    has_many :artwork_shares,
      class_name: 'ArtworkShare',
      foreign_key: :viewer_id,
      primary_key: :id,
      dependent: :destroy 

    has_many :shared_artworks, # shared with current user
      through: :artwork_shares,
      source: :artwork
end
