class ProjectRole < ActiveRecord::Base
  has_many :project_teams
end
