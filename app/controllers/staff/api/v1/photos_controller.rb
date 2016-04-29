module Staff
  module Api
    module V1
      class PhotosController < StaffController

        def index
          @staff_products = Product.all.page(params[:page])

          render json: @staff_products
        end

        def create
          @staff_product = Product.first
          @staff_product.photos.create(file: params[:file])

          respond_to do |format|
            if @staff_product.save
              # format.json { render :index, status: :created, location: staff_api_v1_photos_path }
            else
              format.json { render json: @staff_product.errors, status: :unprocessable_entity }
            end
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
