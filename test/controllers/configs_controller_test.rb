require 'test_helper'

class ConfigsControllerTest < ActionController::TestCase
  setup do
    @config = configs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:configs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create config" do
    assert_difference('Config.count') do
      post :create, config: { google_analytics: @config.google_analytics, google_analytics_counter_id: @config.google_analytics_counter_id, scripts: @config.scripts, sitename: @config.sitename }
    end

    assert_redirected_to config_path(assigns(:config))
  end

  test "should show config" do
    get :show, id: @config
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @config
    assert_response :success
  end

  test "should update config" do
    patch :update, id: @config, config: { google_analytics: @config.google_analytics, google_analytics_counter_id: @config.google_analytics_counter_id, scripts: @config.scripts, sitename: @config.sitename }
    assert_redirected_to config_path(assigns(:config))
  end

  test "should destroy config" do
    assert_difference('Config.count', -1) do
      delete :destroy, id: @config
    end

    assert_redirected_to configs_path
  end
end
