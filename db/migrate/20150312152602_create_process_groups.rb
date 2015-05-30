class CreateProcessGroups < ActiveRecord::Migration
  def change
    create_table :process_groups do |t|
      t.string :name

      t.timestamps
    end
  end
end
