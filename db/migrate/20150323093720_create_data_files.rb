class CreateDataFiles < ActiveRecord::Migration
  def change
    create_table :data_files do |t|
      t.string :project_id
      t.string :document_id

      t.timestamps
    end
  end
end
