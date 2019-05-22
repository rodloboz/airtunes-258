class Artist < ApplicationRecord
  has_many :albums, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :image_url, presence: true
end
