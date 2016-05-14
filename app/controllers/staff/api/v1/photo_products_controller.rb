module Staff
  module Api
    module V1
      class PhotoProductsController < StaffApiController
        before_action :set_staff_api_v1_product, only: [:create, :destroy]

        def create
          @staff_api_v1_product.photos.create(attach: params[:attach])
          if @staff_api_v1_product.save
            render json: @staff_api_v1_product.photos
          else
            format.json { render json: @staff_api_v1_product.errors, status: :unprocessable_entity }
          end
        end


        def destroy
          @staff_photo_product = Photo.find(params[:id])
          @staff_photo_product.destroy
          render json: @staff_api_v1_product.photos
        end


        private
        def set_staff_api_v1_product
          @staff_api_v1_product = Product.find_by_id(params[:product_id])
        end

        def staff_api_photos_params
          params.require(:photo).permit(:name, :attach, :image_id, :image_type)
        end
      end
    end
  end
end
