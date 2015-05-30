json.array!(@process_groups) do |process_group|
  json.extract! process_group, :id, :name
  json.url process_group_url(process_group, format: :json)
end
