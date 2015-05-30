class CreateTemplates < ActiveRecord::Migration
  def change
    create_table :templates do |t|
      t.references :pmbok_doc, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
