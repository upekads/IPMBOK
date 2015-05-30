class TasksController < InheritedResources::Base

  def create
    @project_document = ProjectDocument.find(params[:task][:project_document_id])
    @project = Project.find(@project_document.project_id)
    create!(:notice => "Task is created.") { project_project_document_path(@project, @project_document) }
    @project_document.update(:status =>'Task pending')
  end

  def edit
    @task = Task.find(params[:id])
    @project_document=ProjectDocument.find(@task.project_document_id)
    @project = Project.find(@project_document.project_id)
    @project_current_team=@project.project_teams.all.pluck(:user_id)
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)

    @project_document=ProjectDocument.find(@task.project_document_id)
    @project = Project.find(@project_document.project_id)
    if params[:task][:status]=='Completed'
      @project_document.update(:status=>'File accepted')
    end
    create!(:notice => "Task is updated.") { project_project_document_path(@project, @project_document) }
  end

  def destroy
    @task = Task.find(params[:id])
    @project_document=ProjectDocument.find(@task.project_document_id)
    @project = Project.find(@project_document.project_id)
    @task.destroy
    create!(:notice => "Task is Destroyed.") { project_project_document_path(@project, @project_document) }


  end

  private

    def task_params
      params.require(:task).permit(:project_document_id, :assignee_id, :assigned_id, :priority, :deadline, :status, :comment)
    end
end

