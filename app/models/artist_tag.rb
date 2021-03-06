class ArtistTag < ApplicationRecord
  belongs_to :artist
  belongs_to :tag

  validates :tag, uniqueness: {
                                scope: :artist,
                                message: 'has already been added'
                              }
end
