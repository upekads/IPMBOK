json.array!(@knowledge_areas) do |knowledge_area|
  json.extract! knowledge_area, :id, :name
  json.url knowledge_area_url(knowledge_area, format: :json)
end
