class AddUserIdToProjectDocuments < ActiveRecord::Migration
  def change
    add_column :project_documents, :user_id, :integer
  end
end
