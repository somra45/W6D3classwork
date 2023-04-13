class Artwork < ApplicationRecord
    validates :artist_id, uniqueness: { scope: :title }
    validates :image_url, uniqueness: true, presence: true
    validates :artist_id, presence: true
    validates :title, presence: true
end