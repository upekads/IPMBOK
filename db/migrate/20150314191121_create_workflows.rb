class CreateWorkflows < ActiveRecord::Migration
  def change
    create_table :workflows do |t|
      t.references :subprocess_group, index: true
      t.references :pmbok_doc, index: true
      t.string :direction
      t.string :direction_subprocess

      t.timestamps
    end
  end
end
