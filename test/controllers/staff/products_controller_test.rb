require 'test_helper'

class Staff::ProductsControllerTest < ActionController::TestCase
  setup do
    @staff_product = staff_products(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:staff_products)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create staff_product" do
    assert_difference('Staff::Product.count') do
      post :create, staff_product: { action: @staff_product.action, active: @staff_product.active, desc: @staff_product.desc, hit: @staff_product.hit, meta_desc: @staff_product.meta_desc, meta_key: @staff_product.meta_key, meta_title: @staff_product.meta_title, mini_desc: @staff_product.mini_desc, name: @staff_product.name, new: @staff_product.new, slug: @staff_product.slug }
    end

    assert_redirected_to staff_product_path(assigns(:staff_product))
  end

  test "should show staff_product" do
    get :show, id: @staff_product
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @staff_product
    assert_response :success
  end

  test "should update staff_product" do
    patch :update, id: @staff_product, staff_product: { action: @staff_product.action, active: @staff_product.active, desc: @staff_product.desc, hit: @staff_product.hit, meta_desc: @staff_product.meta_desc, meta_key: @staff_product.meta_key, meta_title: @staff_product.meta_title, mini_desc: @staff_product.mini_desc, name: @staff_product.name, new: @staff_product.new, slug: @staff_product.slug }
    assert_redirected_to staff_product_path(assigns(:staff_product))
  end

  test "should destroy staff_product" do
    assert_difference('Staff::Product.count', -1) do
      delete :destroy, id: @staff_product
    end

    assert_redirected_to staff_products_path
  end
end
