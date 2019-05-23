class ArtistTagsController < ApplicationController
  before_action :set_artist

  def new
    @artist_tag = ArtistTag.new
  end

  def create
    names = params[:artist_tag][:tag].reject(&:empty?).map(&:downcase)
    names.each do |name|
      tag = Tag.find_or_create_by(name: name)
      ArtistTag.create(artist: @artist, tag: tag)
    end

    redirect_to @artist
  end

  private

  def set_artist
    @artist = Artist.find(params[:artist_id])
  end
end
