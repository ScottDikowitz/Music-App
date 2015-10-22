class BandsController < ApplicationController
  def index
    @bands = Band.all
  end
  def show
    @band = Band.find(params[:id])
  end
  def new

  end
  def create
    Band.create!(band_params)
    @bands = Band.all
    render :index
  end
  def band_params
    self.params.require(:band).permit(:name)
  end
end
