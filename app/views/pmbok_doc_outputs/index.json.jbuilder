json.array!(@pmbok_doc_outputs) do |pmbok_doc_output|
  json.extract! pmbok_doc_output, :id, :subprocess_group_id, :document_id, :outputdocument_id, :task
  json.url pmbok_doc_output_url(pmbok_doc_output, format: :json)
end
