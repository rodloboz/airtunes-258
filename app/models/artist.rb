class Artist < ApplicationRecord
  mount_uploader :photo, PhotoUploader

  has_many :albums, dependent: :destroy
  has_many :artist_tags, dependent: :destroy
  has_many :tags, through: :artist_tags

  validates :name, presence: true, uniqueness: true
  validates :photo, presence: true
end
