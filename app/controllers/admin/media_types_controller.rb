class Admin::MediaTypesController < ApplicationController
  before_action :set_admin_media_type, only: %i[ show edit update destroy ]

  # GET /admin/media_types or /admin/media_types.json
  def index
    @admin_media_types = MediaType.all
  end

  # GET /admin/media_types/1 or /admin/media_types/1.json
  def show
  end

  # GET /admin/media_types/new
  def new
    @admin_media_type = MediaType.new
  end

  # GET /admin/media_types/1/edit
  def edit
  end

  # POST /admin/media_types or /admin/media_types.json
  def create
    @admin_media_type = MediaType.create(admin_media_type_params)
    respond_to do |format|
      if @admin_media_type.save
        format.html { redirect_to admin_media_type_url(@admin_media_type), notice: "Media type was successfully created." }
        format.json { render :show, status: :created, location: @admin_media_type }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @admin_media_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/media_types/1 or /admin/media_types/1.json
  def update
    respond_to do |format|
      if @admin_media_type.update(admin_media_type_params)
        format.html { redirect_to admin_media_type_url(@admin_media_type), notice: "Media type was successfully updated." }
        format.json { render :show, status: :ok, location: @admin_media_type }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @admin_media_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/media_types/1 or /admin/media_types/1.json
  def destroy
    @admin_media_type.destroy!

    respond_to do |format|
      format.html { redirect_to admin_media_types_url, notice: "Media type was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_media_type
      @admin_media_type = MediaType.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def admin_media_type_params
      params.require(:media_type).permit(:Name)
    end
end
