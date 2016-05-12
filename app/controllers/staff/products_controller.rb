module Staff
  class ProductsController < StaffController
    before_action :set_staff_product, only: [:show, :edit, :update, :destroy]

    # GET /staff/products
    # GET /staff/products.json
    def index
      @staff_products = Product.all.order(id: :asc).page(params[:page])
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

          if params[:category]
            @staff_product.category_create(params[:category])

            @staff_category = Category.find(params[:category])
            unless @staff_product.categories.exists?(@staff_category)
              @staff_product.categories << @staff_category
            end
            @staff_products_categories = ProductsCategory.where(
                                                                  "product_id = ? AND category_id = ?",
                                                                  @staff_product.id, params[:category]
            ).take!
            @staff_products_categories.update(root_category: true)

          end

          format.html { redirect_to edit_staff_product_path(@staff_product), notice: t('products.new_success') }
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

          if params[:category]
            @staff_product.category_create(params[:category])
            # @staff_category = Category.find(params[:category])
            # unless @staff_product.categories.exists?(@staff_category)
              # @staff_product.categories << @staff_category
            # end
            # @staff_products_categories = ProductsCategory.where(
            #                                                       "product_id = ? AND category_id = ?",
            #                                                       @staff_product.id, params[:category]
            # ).take!
            # @staff_products_categories.update(root_category: true)
          end

          format.html { redirect_to staff_products_path, notice: t('products.edit_success') }
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
        format.html { redirect_to staff_products_url, notice: t('products.destroy_success') }
        format.json { head :no_content }
      end
    end


    private
    # Use callbacks to share common setup or constraints between actions.
    def set_staff_product
      @staff_product = Product.find_by_slug(params[:id])
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def staff_product_params
      params.require(:product).permit(:name, :slug, :hit, :new, :action, :active, :mini_desc, :desc, :meta_title,
                                      :meta_key, :meta_desc,
                                      :category_ids => [],
                                      :photos => [:url, :id, :image_id, :image_type])
    end


    # def staff_product_photos_params
    #   params.require(:photos).permit(:url)
    # end

  end
end
