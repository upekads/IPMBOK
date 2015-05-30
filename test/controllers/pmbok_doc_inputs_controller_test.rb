require 'test_helper'

class PmbokDocInputsControllerTest < ActionController::TestCase
  setup do
    @pmbok_doc_input = pmbok_doc_inputs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pmbok_doc_inputs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pmbok_doc_input" do
    assert_difference('PmbokDocInput.count') do
      post :create, pmbok_doc_input: { document_id: @pmbok_doc_input.document_id, inputdocument_id: @pmbok_doc_input.inputdocument_id, subprocess_group_id: @pmbok_doc_input.subprocess_group_id }
    end

    assert_redirected_to pmbok_doc_input_path(assigns(:pmbok_doc_input))
  end

  test "should show pmbok_doc_input" do
    get :show, id: @pmbok_doc_input
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pmbok_doc_input
    assert_response :success
  end

  test "should update pmbok_doc_input" do
    patch :update, id: @pmbok_doc_input, pmbok_doc_input: { document_id: @pmbok_doc_input.document_id, inputdocument_id: @pmbok_doc_input.inputdocument_id, subprocess_group_id: @pmbok_doc_input.subprocess_group_id }
    assert_redirected_to pmbok_doc_input_path(assigns(:pmbok_doc_input))
  end

  test "should destroy pmbok_doc_input" do
    assert_difference('PmbokDocInput.count', -1) do
      delete :destroy, id: @pmbok_doc_input
    end

    assert_redirected_to pmbok_doc_inputs_path
  end
end
