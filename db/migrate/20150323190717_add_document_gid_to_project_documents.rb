class AddDocumentGidToProjectDocuments < ActiveRecord::Migration
  def change
    add_column :project_documents, :document_gid, :string
  end
end
