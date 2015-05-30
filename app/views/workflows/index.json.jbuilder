json.array!(@workflows) do |workflow|
  json.extract! workflow, :id, :subprocess_group_id, :pmbok_doc_id, :direction, :direction_subprocess
  json.url workflow_url(workflow, format: :json)
end
