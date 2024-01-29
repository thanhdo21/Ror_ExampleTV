class Admin::AlbumsController < ApplicationController
  # before_action :authenticate_user!, :is_admin?
  before_action :set_album, only: %i[ show edit update destroy ]
  # layout "layouts/admin/application"
  @title="Albums"
  def index
    # @albums=Album.all    
    @albums=Album.page(params[:page]).per(5)    
  end

  def show 
  end
  
  def edit
  
  end

  def create
    @album = Album.create(album_params)
    respond_to do |format|
      if @album.save
        format.html { redirect_to admin_albums_url(), notice: "Media type was successfully created." }
        format.json { render :show, status: :created, location: @album }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @album.update(album_params)
        format.html { redirect_to admin_albums_url(), notice: "Media type was successfully updated." }
        format.json { render :show, status: :ok, location: @album }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end  
  end

  def destroy
    @albums=Album.all    
  end

  def new
    @album=Album.new
    # @artists=Artist.all   
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_album
      @album = Album.find(params[:id])
    end
    # Only allow a list of trusted parameters through.
    def album_params
      params.require(:album).permit(:Title,:ArtistId)
    end
end
