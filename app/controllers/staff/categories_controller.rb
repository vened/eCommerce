module Staff
  class CategoriesController < StaffController
    before_action :set_category, only: [:show, :edit, :update, :destroy]

    # GET /categories
    # GET /categories.json
    def index
      @categories = Category.roots.page(params[:page])
    end


    def show
    end


    def new
      @category = Category.new
    end


    def edit
    end


    def create
      @category = Category.new(category_params)

      respond_to do |format|
        if @category.save
          format.html { redirect_to staff_categories_url, notice: 'Category was successfully created.' }
          format.json { render :show, status: :created, location: staff_categories_url }
        else
          format.html { render :new }
          format.json { render json: @category.errors, status: :unprocessable_entity }
        end
      end
    end


    def update
      respond_to do |format|
        if @category.update(category_params)
          format.html { redirect_to staff_categories_url, notice: t('categories.edit_success') }
          format.json { render :show, status: :ok, location: staff_categories_url }
        else
          format.html { render :edit }
          format.json { render json: @category.errors, status: :unprocessable_entity }
        end
      end
    end


    def destroy
      @category.destroy
      respond_to do |format|
        format.html { redirect_to staff_categories_url, notice: 'Категория успешно удалена' }
        format.json { head :no_content }
      end
    end


    private
    def set_category
      @category = Category.find_by_slug(params[:id])
    end


    def category_params
      params.require(:category).permit(:name, :title, :desc, :meta_title, :meta_key, :meta_desc, :slug, :pub, :parent_id)
    end
  end
end
