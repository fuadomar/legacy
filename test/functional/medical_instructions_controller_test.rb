require 'test_helper'

class MedicalInstructionsControllerTest < ActionController::TestCase
  setup do
    @medical_instruction = medical_instructions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:medical_instructions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create medical_instruction" do
    assert_difference('MedicalInstruction.count') do
      post :create, :medical_instruction => @medical_instruction.attributes
    end

    assert_redirected_to medical_instruction_path(assigns(:medical_instruction))
  end

  test "should show medical_instruction" do
    get :show, :id => @medical_instruction.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @medical_instruction.to_param
    assert_response :success
  end

  test "should update medical_instruction" do
    put :update, :id => @medical_instruction.to_param, :medical_instruction => @medical_instruction.attributes
    assert_redirected_to medical_instruction_path(assigns(:medical_instruction))
  end

  test "should destroy medical_instruction" do
    assert_difference('MedicalInstruction.count', -1) do
      delete :destroy, :id => @medical_instruction.to_param
    end

    assert_redirected_to medical_instructions_path
  end
end
