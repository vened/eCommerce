class ProductVariant < ActiveRecord::Base

  has_many :photos, as: :image
  belongs_to :product

end
