class ImagesController < ApplicationController

  def index
    @imageable = find_imageable
    @images = @imageable.images

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @images.map { |image| image.to_jq_upload(params[:image_gallery_id]) } }
    end
  end

  def show
    @image = Image.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @image }
    end
  end

  def new
    @imageable = find_imageable
    @images = @imageable.images
    @image = Image.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @image }
    end
  end

  def edit
    @image = Image.find(params[:id])
  end

  def create
    @imageable = find_imageable

    @imageable.update_attributes(cover_id: @imageable.images.first.id) if @imageable.cover.blank? && @imageable.images.first.present?

    @image = @imageable.images.build(image_params)
    respond_to do |format|
      if @image.save

        format.html {
          render :json => [@image.to_jq_upload(params[:image_gallery_id])].to_json,
                 :content_type => 'text/html',
                 :layout => false
        }
        format.json { render :json => [@image.to_jq_upload(params[:image_gallery_id])].to_json }
      else
        format.html { render action: "new" }
        format.json { render json: @image.errors, status: :unprocessable_entity }

      end

    end
  end

  def update
    @image = image.find(params[:id])

    respond_to do |format|
      if @image.update_attributes(image_params)
        format.html { redirect_to @image, notice: 'Upload was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @image = Image.find(params[:id])
    @image.destroy

    respond_to do |format|
      format.html { redirect_to uploads_url }
      format.json { head :no_content }
    end
  end
  private

  def image_params
    params.require(:image).permit(:name)
  end

  private

  def find_imageable
    params.each do |name, value|
      if name =~ /(.+)_id$/
        return $1.classify.constantize.find(value)
      end
    end
    nil
  end

end
