class Photo < ActiveRecord::Base
  belongs_to :image, polymorphic: true

  mount_uploader :file, PhotoUploader
end
