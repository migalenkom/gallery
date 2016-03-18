class Image < ActiveRecord::Base
  include Rails.application.routes.url_helpers
  mount_uploader :name, ImageUploader

  belongs_to :imageable, polymorphic: true

  def to_jq_upload
    {
        "name" => read_attribute(:name),
        "size" => name.size,
        "url" => name.url,
        "thumbnail_url" => name.thumb.url,
        "delete_url" => "/images/#{id}",
        "image_id" => image_path(id),
        "delete_type" => "DELETE"
    }
  end


end
