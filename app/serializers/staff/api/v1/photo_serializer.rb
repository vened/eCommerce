module Staff
  module Api
    module V1
      class PhotoSerializer < ActiveModel::Serializer
        attributes :id, :name
      end
    end
  end
end
