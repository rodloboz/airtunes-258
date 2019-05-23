class Artist < ApplicationRecord
  has_many :albums, dependent: :destroy
  has_many :artist_tags, dependent: :destroy
  has_many :tags, through: :artist_tags

  validates :name, presence: true, uniqueness: true
  validates :image_url, presence: true
end
