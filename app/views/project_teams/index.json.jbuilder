json.array!(@project_teams) do |project_team|
  json.extract! project_team, :id, :user_id, :project_id, :project_role_id
  json.url project_team_url(project_team, format: :json)
end
