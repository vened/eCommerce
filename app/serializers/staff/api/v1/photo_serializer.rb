module Staff
  module Api
    module V1
      class PhotoSerializer < ActiveModel::Serializer
        attributes :id, :name, :attach
      end
    end
  end
end
