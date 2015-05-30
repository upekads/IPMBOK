json.array!(@subprocess_groups) do |subprocess_group|
  json.extract! subprocess_group, :id, :name, :code, :process_group_id, :knowledge_area_id
  json.url subprocess_group_url(subprocess_group, format: :json)
end
