json.array!(@pmbok_doc_inputs) do |pmbok_doc_input|
  json.extract! pmbok_doc_input, :id, :subprocess_group_id, :document_id, :inputdocument_id
  json.url pmbok_doc_input_url(pmbok_doc_input, format: :json)
end
