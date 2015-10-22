class AlbumsController < ApplicationController
  def show
    @album = Album.find(params[:id])
  end

  def create
    @album = Album.new(album_params)
    if @album.save
      redirect_to band_url(@album.band_id)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def new
    @band_id = params[:band_id]
    @bands = Band.all
  end

  def album_params
    self.params.require(:album).permit(:name, :band_id)
  end
end
