class AddProjectGidToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :project_gid, :string
  end
end
