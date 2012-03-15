require 'test_helper'

class SharingRulesControllerTest < ActionController::TestCase
  setup do
    @sharing_rule = sharing_rules(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sharing_rules)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sharing_rule" do
    assert_difference('SharingRule.count') do
      post :create, :sharing_rule => @sharing_rule.attributes
    end

    assert_redirected_to sharing_rule_path(assigns(:sharing_rule))
  end

  test "should show sharing_rule" do
    get :show, :id => @sharing_rule.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @sharing_rule.to_param
    assert_response :success
  end

  test "should update sharing_rule" do
    put :update, :id => @sharing_rule.to_param, :sharing_rule => @sharing_rule.attributes
    assert_redirected_to sharing_rule_path(assigns(:sharing_rule))
  end

  test "should destroy sharing_rule" do
    assert_difference('SharingRule.count', -1) do
      delete :destroy, :id => @sharing_rule.to_param
    end

    assert_redirected_to sharing_rules_path
  end
end
