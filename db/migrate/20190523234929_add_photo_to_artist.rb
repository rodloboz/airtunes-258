class AddPhotoToArtist < ActiveRecord::Migration[5.2]
  def change
    add_column :artists, :photo, :string
    remove_column :artists, :image_url
  end
end
