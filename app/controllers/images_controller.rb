class ImagesController < ApplicationController

  def index
    @images = Image.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @images.map { |image| image.to_jq_upload } }
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
    @image = Image.new(image_params)

    respond_to do |format|
      if @image.save

        # @user = User.find(session[:user_id])
        # if @user.present?
        #   @user.uploads << @upload
        #   @user.save
        # end
        format.html {
          render :json => [@image.to_jq_upload].to_json,
                 :content_type => 'text/html',
                 :layout => false
        }
        format.json { render :json => [@image.to_jq_upload].to_json }
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

end
