class Tag < ApplicationRecord
  has_many :artist_tags, dependent: :destroy
  has_many :artists, through: :artist_tags

  validates :name, presence: true, uniqueness: { insensitive: true }

  def self.list_names
    pluck(:name).map(&:capitalize).sort
  end
end
