module Shop
  class ProductsController < ApplicationController
    before_action :set_staff_product, only: [:show, :edit, :update, :destroy]

    # GET /staff/products
    # GET /staff/products.json
    def index
      @staff_products = Product.all.page(params[:page])
    end


    # GET /staff/products/1
    # GET /staff/products/1.json
    def show
    end


    # GET /staff/products/new
    def new
      @staff_product = Product.new
    end


    # GET /staff/products/1/edit
    def edit
    end


    # POST /staff/products
    # POST /staff/products.json
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


    # PATCH/PUT /staff/products/1
    # PATCH/PUT /staff/products/1.json
    def update
      respond_to do |format|
        if @staff_product.update(staff_product_params)
          format.html { redirect_to staff_products_path, notice: 'Product was successfully updated.' }
          format.json { render :show, status: :ok, location: staff_products_path }
        else
          format.html { render :edit }
          format.json { render json: @staff_product.errors, status: :unprocessable_entity }
        end
      end
    end


    # DELETE /staff/products/1
    # DELETE /staff/products/1.json
    def destroy
      @staff_product.destroy
      respond_to do |format|
        format.html { redirect_to staff_products_url, notice: 'Product was successfully destroyed.' }
        format.json { head :no_content }
      end
    end


    private
    # Use callbacks to share common setup or constraints between actions.
    def set_staff_product
      @staff_product = Product.find(params[:id])
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def staff_product_params
      params.require(:product).permit(:name, :slug, :hit, :new, :action, :active, :mini_desc, :desc, :meta_title, :meta_key, :meta_desc)
    end
  end
end
