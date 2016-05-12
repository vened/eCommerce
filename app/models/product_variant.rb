class ProductVariant < ActiveRecord::Base

  has_many :photos, as: :image

end
