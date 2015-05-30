class CreatePmbokDocs < ActiveRecord::Migration
  def change
    create_table :pmbok_docs do |t|
      t.string :name

      t.timestamps
    end
  end
end
