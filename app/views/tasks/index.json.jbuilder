json.array!(@tasks) do |task|
  json.extract! task, :id, :project_document_id, :assignee_id, :assigned_id
  json.url task_url(task, format: :json)
end
