module Staff
  module Api
    module V1
      class ProductVariantsController < StaffController
        before_action :set_staff_api_v1_product, only: [:index, :create, :update, :destroy]
        before_action :set_staff_api_v1_product_variant, only: [:update, :destroy]

        def index
          render json: @staff_api_v1_product.product_variants.order(:id)
        end

        def edit
        end

        def create
          @staff_api_v1_product_variant = @staff_api_v1_product.product_variants.new(staff_api_v1_product_variants_params)

          respond_to do |format|
            if @staff_api_v1_product_variant.save
              format.json { render json: @staff_api_v1_product.product_variants.order(:id), status: :created, location: staff_api_v1_product_product_variants_path }
            else
              format.json { render json: @staff_api_v1_product.product_variants.errors, status: :unprocessable_entity }
            end
          end
        end

        def update
          respond_to do |format|
            if @staff_api_v1_product_variant.update(staff_api_v1_product_variants_params)
              format.json { render json: @staff_api_v1_product.product_variants.order(:id), status: :ok }
            else
              format.json { render json: @staff_api_v1_product_variant.errors, status: :unprocessable_entity }
            end
          end
        end

        def destroy
          @staff_product.destroy
          respond_to do |format|
            format.html { redirect_to staff_products_url, notice: 'Product was successfully destroyed.' }
            format.json { head :no_content }
          end
        end


        private
        def set_staff_api_v1_product
          @staff_api_v1_product = Product.find_by_id(params[:product_id])
        end

        def set_staff_api_v1_product_variant
          @staff_api_v1_product_variant = ProductVariant.find(params[:id])
        end

        def staff_api_v1_product_variants_params
          params.require(:product_variant).permit(:sku, :name, :price, :old_price, :product_id)
        end
      end
    end
  end
end
