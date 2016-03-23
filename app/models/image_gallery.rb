class ImageGallery < ActiveRecord::Base


   validates_presence_of :name
   belongs_to :cover, :class_name => :Image,:foreign_key => "cover_id"


   has_many :images, :dependent => :destroy, as: :imageable


end
