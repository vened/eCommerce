module Staff
  module Api
    module V1
      class ProductVariantSerializer < ActiveModel::Serializer
        attributes :id, :sku, :name, :price, :old_price, :product_id
      end
    end
  end
end
