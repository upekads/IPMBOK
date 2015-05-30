class AddLastVersionToProjectsDocument < ActiveRecord::Migration
  def change
    add_column :project_documents, :last_version, :integer
  end
end
