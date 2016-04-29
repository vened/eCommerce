module Staff
  module Api
    module V1
      class PhotoProductsController < StaffApiController

        def index
          @staff_product       = Product.first
          @staff_api_v1_photos = @staff_product.photos

          render json: @staff_api_v1_photos
        end


        def create
          @staff_product = Product.find_by_slug(params[:product_id])
          @staff_product.photos.create(file: params[:file])

          if @staff_product.save
            # format.json { render :index, status: :created, location: staff_api_v1_photos_path }
            render json: @staff_product.photos
          else
            format.json { render json: @staff_product.errors, status: :unprocessable_entity }
          end
        end


        def destroy
          @staff_photo_product = Photo.find(params[:id])
          @staff_photo_product.destroy
          @staff_product = Product.find(params[:product_id])
          render json: @staff_product.photos
        end


        private
        def staff_api_photos_params
          params.require(:photo).permit(:name, :file, :image_id, :image_type)
        end
      end
    end
  end
end
