require 'test_helper'

class PmbokDocOutputsControllerTest < ActionController::TestCase
  setup do
    @pmbok_doc_output = pmbok_doc_outputs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pmbok_doc_outputs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pmbok_doc_output" do
    assert_difference('PmbokDocOutput.count') do
      post :create, pmbok_doc_output: { document_id: @pmbok_doc_output.document_id, outputdocument_id: @pmbok_doc_output.outputdocument_id, subprocess_group_id: @pmbok_doc_output.subprocess_group_id, task: @pmbok_doc_output.task }
    end

    assert_redirected_to pmbok_doc_output_path(assigns(:pmbok_doc_output))
  end

  test "should show pmbok_doc_output" do
    get :show, id: @pmbok_doc_output
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pmbok_doc_output
    assert_response :success
  end

  test "should update pmbok_doc_output" do
    patch :update, id: @pmbok_doc_output, pmbok_doc_output: { document_id: @pmbok_doc_output.document_id, outputdocument_id: @pmbok_doc_output.outputdocument_id, subprocess_group_id: @pmbok_doc_output.subprocess_group_id, task: @pmbok_doc_output.task }
    assert_redirected_to pmbok_doc_output_path(assigns(:pmbok_doc_output))
  end

  test "should destroy pmbok_doc_output" do
    assert_difference('PmbokDocOutput.count', -1) do
      delete :destroy, id: @pmbok_doc_output
    end

    assert_redirected_to pmbok_doc_outputs_path
  end
end
