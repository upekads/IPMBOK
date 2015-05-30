require 'test_helper'

class ProjectTeamsControllerTest < ActionController::TestCase
  setup do
    @project_team = project_teams(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:project_teams)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create project_team" do
    assert_difference('ProjectTeam.count') do
      post :create, project_team: { project_id: @project_team.project_id, project_role_id: @project_team.project_role_id, user_id: @project_team.user_id }
    end

    assert_redirected_to project_team_path(assigns(:project_team))
  end

  test "should show project_team" do
    get :show, id: @project_team
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @project_team
    assert_response :success
  end

  test "should update project_team" do
    patch :update, id: @project_team, project_team: { project_id: @project_team.project_id, project_role_id: @project_team.project_role_id, user_id: @project_team.user_id }
    assert_redirected_to project_team_path(assigns(:project_team))
  end

  test "should destroy project_team" do
    assert_difference('ProjectTeam.count', -1) do
      delete :destroy, id: @project_team
    end

    assert_redirected_to project_teams_path
  end
end
