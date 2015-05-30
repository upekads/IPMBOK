class CreateVersion < ActiveRecord::Migration
  def change
    create_table :versions do |t|
      t.integer :project_document_id
      t.string :docname
      t.string :document_gid
    end
  end
end
