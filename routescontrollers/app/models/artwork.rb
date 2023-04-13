class Artwork < ApplicationRecord
    validates :artist_id, uniqueness: { scope: :title }
end