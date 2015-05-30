class CreatePmbokDocOutputs < ActiveRecord::Migration
  def change
    create_table :pmbok_doc_outputs do |t|
      t.references :subprocess_group, index: true
      t.integer :document_id
      t.integer :outputdocument_id
      t.string :task

      t.timestamps
    end
  end
end
