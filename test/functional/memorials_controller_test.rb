require 'test_helper'

class MemorialsControllerTest < ActionController::TestCase
  setup do
    @memorial = memorials(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:memorials)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create memorial" do
    assert_difference('Memorial.count') do
      post :create, :memorial => @memorial.attributes
    end

    assert_redirected_to memorial_path(assigns(:memorial))
  end

  test "should show memorial" do
    get :show, :id => @memorial.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @memorial.to_param
    assert_response :success
  end

  test "should update memorial" do
    put :update, :id => @memorial.to_param, :memorial => @memorial.attributes
    assert_redirected_to memorial_path(assigns(:memorial))
  end

  test "should destroy memorial" do
    assert_difference('Memorial.count', -1) do
      delete :destroy, :id => @memorial.to_param
    end

    assert_redirected_to memorials_path
  end
end
