class SongsController < ApplicationController
  def index
    @songs=Song.all
  end

  def show
    @song=Song.find(params[:id])
    @artist=Artist.find(@song.artist_id)
    @genre=Genre.find(@song.genre_id)
  end
  def new
    @song=Song.new
  end

  def create
    @song=Song.create(params.require(:song).permit(:name, :artist_id, :genre_id))
    redirect_to song_path(@song)
  end
  def edit
    @song=Song.find(params[:id])
  end
  def update
    @song=Song.update(params.require(:song).permit(:name, :artist_id, :genre_id))
    redirect_to song_path(@song)
  end
end
