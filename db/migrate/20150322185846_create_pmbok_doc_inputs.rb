class CreatePmbokDocInputs < ActiveRecord::Migration
  def change
    create_table :pmbok_doc_inputs do |t|
      t.references :subprocess_group, index: true
      t.integer :document_id
      t.integer :inputdocument_id

      t.timestamps
    end
  end
end
