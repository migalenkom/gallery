class Image < ActiveRecord::Base
  include Rails.application.routes.url_helpers
  mount_uploader :name, ImageUploader

  belongs_to :imageable, polymorphic: true

  def to_jq_upload(image_gallery_id)
    {
        "name" => read_attribute(:name),
        "size" => name.size,
        "url" => name.url,
        "thumbnail_url" => name.thumb.url,
        "delete_url" => image_gallery_image_path(image_gallery_id, id),
        "image_id" =>  image_gallery_image_path(image_gallery_id, id),
        "delete_type" => "DELETE"
    }
  end


end
