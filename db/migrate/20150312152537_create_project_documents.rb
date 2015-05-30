class CreateProjectDocuments < ActiveRecord::Migration
  def change
    create_table :project_documents do |t|
      t.references :pmbok_doc, index: true
      t.references :project, index: true
      t.string :docname

      t.timestamps
    end
  end
end
