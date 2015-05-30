class AddProjectcodeToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :projectcode, :string
  end
end
