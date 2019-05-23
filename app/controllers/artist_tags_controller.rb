class ArtistTagsController < ApplicationController
  before_action :set_artist

  def new
    @artist_tag = ArtistTag.new
  end

  def create
    name = params[:artist_tag][:tag].downcase
    tag = Tag.find_by(name: name)

    if tag
      if !@artist.tags.include?(tag)
        @artist.tags << tag
      end

      redirect_to @artist
    else
      render :new
    end
  end

  private

  def set_artist
    @artist = Artist.find(params[:artist_id])
  end
end
