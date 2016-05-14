module Staff
  module Api
    module V1
      class PhotoProductVariantsController < StaffApiController
        before_action :set_staff_api_v1_product_variants, only: [:create, :destroy]

        def create
          @staff_api_v1_product_variants.photos.create(attach: params[:attach])
          if @staff_api_v1_product_variants.save
            render json: @staff_api_v1_product_variants.photos
          else
            format.json { render json: @staff_api_v1_product_variants.errors, status: :unprocessable_entity }
          end
        end


        def destroy
          @staff_photo_product_variants = Photo.find(params[:id])
          @staff_photo_product_variants.destroy
          render json: @staff_api_v1_product_variants.photos
        end


        private
        def set_staff_api_v1_product_variants
          @staff_api_v1_product_variants = ProductVariant.find_by_id(params[:product_variant_id])
        end

        def staff_api_photos_params
          params.require(:photo).permit(:name, :attach, :image_id, :image_type)
        end
      end
    end
  end
end
