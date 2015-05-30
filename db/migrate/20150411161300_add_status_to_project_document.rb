class AddStatusToProjectDocument < ActiveRecord::Migration
  def change
    add_column :project_documents, :status, :string
  end
end
