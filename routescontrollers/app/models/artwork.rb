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

    has_many :shared_viewers,
        through: :shares,
        source: :viewer
end