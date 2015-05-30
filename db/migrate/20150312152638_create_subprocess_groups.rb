class CreateSubprocessGroups < ActiveRecord::Migration
  def change
    create_table :subprocess_groups do |t|
      t.string :code
      t.string :name
      t.references :process_group, index: true
      t.references :knowledge_area, index: true

      t.timestamps
    end
  end
end
