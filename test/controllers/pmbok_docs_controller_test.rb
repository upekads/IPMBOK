require 'test_helper'

class PmbokDocsControllerTest < ActionController::TestCase
  setup do
    @pmbok_doc = pmbok_docs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pmbok_docs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pmbok_doc" do
    assert_difference('PmbokDoc.count') do
      post :create, pmbok_doc: { name: @pmbok_doc.name }
    end

    assert_redirected_to pmbok_doc_path(assigns(:pmbok_doc))
  end

  test "should show pmbok_doc" do
    get :show, id: @pmbok_doc
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pmbok_doc
    assert_response :success
  end

  test "should update pmbok_doc" do
    patch :update, id: @pmbok_doc, pmbok_doc: { name: @pmbok_doc.name }
    assert_redirected_to pmbok_doc_path(assigns(:pmbok_doc))
  end

  test "should destroy pmbok_doc" do
    assert_difference('PmbokDoc.count', -1) do
      delete :destroy, id: @pmbok_doc
    end

    assert_redirected_to pmbok_docs_path
  end
end
