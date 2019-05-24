class Album < ApplicationRecord
  mount_uploader :photo, PhotoUploader

  belongs_to :artist

  validates :title, :photo, presence: true
end
