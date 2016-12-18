class AlbumsController < ApplicationController

  def create
    @album = Album.new(album_params)
    if @album.save
      redirect_to album_url(@album)
    else
      flash.now[:errors] = @album.errors.full_messages
      render :new
    end
  end

  def new
    @album = Album.new
    render :new
  end

  def edit
    @album = Album.find_by_id(params[:id])
    render :edit
  end

  def show
    @album = Album.find_by_id(params[:id])
    render :show
  end

  def update
    @album = Album.find_by_id(params[:id])
    if @album.update_attributes(album_params)
      redirect_to band_url(@album.id)
    else
      flash.now[:errors] = @album.errors.full_messages
      render :edit
    end
  end

  def destroy
    Album.delete(params[:id])
    redirect_to albums_url
  end

  private
  def album_params
    params.require(:album).permit(:name, :recording, :band_id)
  end
end
