class CreateProjectTeams < ActiveRecord::Migration
  def change
    create_table :project_teams do |t|
      t.references :user, index: true
      t.references :project, index: true
      t.references :project_role, index: true

      t.timestamps
    end
  end
end
