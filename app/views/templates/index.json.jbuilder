json.array!(@templates) do |template|
  json.extract! template, :id, :pmbok_doc_id, :user_id
  json.url template_url(template, format: :json)
end
