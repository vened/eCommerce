module Staff
  module Api
    module V1
      class ProductVariantsController < StaffController
        before_action :set_staff_product_variants, only: [:show, :edit, :update, :destroy]

        def index
          @staff_api_v1_product_variants = Product.find_by_id(params[:product_id]).product_variants

          render json: @staff_api_v1_product_variants
        end

        def show
        end

        def new
          @staff_product = Product.new
        end

        def edit
        end

        def create
          @staff_product = Product.new(staff_product_params)

          respond_to do |format|
            if @staff_product.save
              format.html { redirect_to staff_products_path, notice: 'Product was successfully created.' }
              format.json { render :show, status: :created, location: staff_products_path }
            else
              format.html { render :new }
              format.json { render json: @staff_product.errors, status: :unprocessable_entity }
            end
          end
        end

        def update
          respond_to do |format|
            if @staff_product.update(staff_product_params)
              format.json { render json: @staff_product, status: :ok }
            else
              format.json { render json: @staff_product.errors, status: :unprocessable_entity }
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
        def set_staff_product_variants
          @staff_product = Product.find(params[:id])
        end

        def staff_product_variants_params
          params.require(:product).permit(:product_id)
        end
      end
    end
  end
end
