class ImageGalleriesController < ApplicationController

  def index
    @galleries =ImageGallery.order(:name).page(params[:page])
  end

  def new
    @gallery = ImageGallery.new
    respond_to do |format|
      format.html
      format.js {}
    end
  end

  def create
    @gallery = ImageGallery.new(gallery_params)

    if @gallery.save
      redirect_to image_galleries_path, notice: 'Gallery created successfully'
    else
      redirect_to action: :new
    end
  end

  def edit
    @gallery = ImageGallery.find(params[:id])

    respond_to do |format|
      format.html {}
      format.js {}

    end
  end
  def update

    @gallery = ImageGallery.find(params[:id])

    if  @gallery.present?
      @gallery.update_attributes(gallery_params)
    end
    respond_to do |format|

      format.html do
        if @gallery.present?
          redirect_to image_galleries_path(@gallery), notice: 'Gallery was successfully updated.'
        else
          redirect_to edit_image_gallery_image_path(@gallery), notice: 'Incorrect values'
        end
      end
      format.js {}
    end
  end

  def destroy

    @gallery = ImageGallery.find(params[:id])
    @gallery.destroy

    respond_to do |format|
      format.html { redirect_to image_galleries_path }
      format.json { head :no_content }
      format.js
    end
  end
  def current_resource
    @current_resource ||= ImageGallery.find(params[:id]) if params[:id]
  end

  private

  def gallery_params
    params.require(:image_gallery).permit(:name, :description)
  end

end
