module ProjectsHelper
  def findProjectManagerById(project_id)
    @project_object = Project.find(project_id)
    @project_manager_user_id=@project_object.project_teams.where("project_role_id =?", 1).pluck(:user_id)
    @project_manager_object =User.find(@project_manager_user_id[0])

    return @project_manager_object
  end
end
