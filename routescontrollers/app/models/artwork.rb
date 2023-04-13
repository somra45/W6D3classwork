class Artwork < ApplicationRecord
    validates :artist_id, uniqueness: { scope: :title }
    validates :image_url, uniqueness: true, presence: true
    # validates :artist_id, presence: true
    validates :title, presence: true
    
    belongs_to :artist,
        foreign_key: :artist_id,
        class_name: :User

    has_many :shares,
        foreign_key: :artwork_id,
        class_name: :ArtworkShare,
        dependent: :destroy
    has_many :comments,
        foreign_key: :artwork_id,
        class_name: :Comment
        dependent: :destroy

    has_many :shared_viewers,
        through: :shares,
        source: :viewer
    
        
    def self.artworks_for_user_id(user_id)
        artworks = []
        user = User.find(user_id)
        artworks += user.artworks
        artworks += user.shared_artworks
        artworks
    end
end