require 'test_helper'

class SubprocessGroupsControllerTest < ActionController::TestCase
  setup do
    @subprocess_group = subprocess_groups(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:subprocess_groups)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create subprocess_group" do
    assert_difference('SubprocessGroup.count') do
      post :create, subprocess_group: { code: @subprocess_group.code, knowledge_area_id: @subprocess_group.knowledge_area_id, name: @subprocess_group.name, process_group_id: @subprocess_group.process_group_id }
    end

    assert_redirected_to subprocess_group_path(assigns(:subprocess_group))
  end

  test "should show subprocess_group" do
    get :show, id: @subprocess_group
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @subprocess_group
    assert_response :success
  end

  test "should update subprocess_group" do
    patch :update, id: @subprocess_group, subprocess_group: { code: @subprocess_group.code, knowledge_area_id: @subprocess_group.knowledge_area_id, name: @subprocess_group.name, process_group_id: @subprocess_group.process_group_id }
    assert_redirected_to subprocess_group_path(assigns(:subprocess_group))
  end

  test "should destroy subprocess_group" do
    assert_difference('SubprocessGroup.count', -1) do
      delete :destroy, id: @subprocess_group
    end

    assert_redirected_to subprocess_groups_path
  end
end
