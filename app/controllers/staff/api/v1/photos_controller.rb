module Staff
  module Api
    module V1
      class PhotosController < StaffApiController

        def index
          @staff_product = Product.first
          @staff_api_v1_photos = @staff_product.photos

          render json: @staff_api_v1_photos, each_serializer: Staff::Api::V1::PhotoSerializer
        end


        def create
          @staff_product = Product.first
          @staff_product.photos.create(file: params[:file])

          if @staff_product.save
            # format.json { render :index, status: :created, location: staff_api_v1_photos_path }
            render json: @staff_product.photos
          else
            format.json { render json: @staff_product.errors, status: :unprocessable_entity }
          end
        end


        private
        def staff_api_photos_params
          params.require(:photo).permit(:name, :file, :image_id, :image_type)
        end
      end
    end
  end
end
