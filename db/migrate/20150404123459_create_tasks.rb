class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.references :project_document, index: true
      t.integer :assignee_id
      t.integer :assigned_id

      t.timestamps
    end
  end
end
