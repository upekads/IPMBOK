require 'test_helper'

class ProcessGroupsControllerTest < ActionController::TestCase
  setup do
    @process_group = process_groups(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:process_groups)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create process_group" do
    assert_difference('ProcessGroup.count') do
      post :create, process_group: { name: @process_group.name }
    end

    assert_redirected_to process_group_path(assigns(:process_group))
  end

  test "should show process_group" do
    get :show, id: @process_group
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @process_group
    assert_response :success
  end

  test "should update process_group" do
    patch :update, id: @process_group, process_group: { name: @process_group.name }
    assert_redirected_to process_group_path(assigns(:process_group))
  end

  test "should destroy process_group" do
    assert_difference('ProcessGroup.count', -1) do
      delete :destroy, id: @process_group
    end

    assert_redirected_to process_groups_path
  end
end
