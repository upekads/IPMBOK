module TasksHelper

  def getTaskID(assigned_id,project_document_id)
    @task=Task.where('assigned_id =?',assigned_id).where('project_document_id =?',project_document_id).where("status like ?","%Open%").first()

    return @task
  end
end
