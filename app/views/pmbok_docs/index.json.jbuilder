json.array!(@pmbok_docs) do |pmbok_doc|
  json.extract! pmbok_doc, :id, :name
  json.url pmbok_doc_url(pmbok_doc, format: :json)
end
