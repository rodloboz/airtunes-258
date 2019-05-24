class AddPhotoToAlbums < ActiveRecord::Migration[5.2]
  def change
    add_column :albums, :photo, :string
    remove_column :albums, :image_url
  end
end
