require 'test_helper'

class DistributorsControllerTest < ActionController::TestCase
  setup do
    @distributor = distributors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:distributors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create distributor" do
    assert_difference('Distributor.count') do
      post :create, :distributor => @distributor.attributes
    end

    assert_redirected_to distributor_path(assigns(:distributor))
  end

  test "should show distributor" do
    get :show, :id => @distributor.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @distributor.to_param
    assert_response :success
  end

  test "should update distributor" do
    put :update, :id => @distributor.to_param, :distributor => @distributor.attributes
    assert_redirected_to distributor_path(assigns(:distributor))
  end

  test "should destroy distributor" do
    assert_difference('Distributor.count', -1) do
      delete :destroy, :id => @distributor.to_param
    end

    assert_redirected_to distributors_path
  end
end
