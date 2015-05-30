class AddTaskToPmbokDocInputs < ActiveRecord::Migration
  def change
    add_column :pmbok_doc_inputs, :task, :string
  end
end
