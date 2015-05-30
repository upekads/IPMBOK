class AddSubprocessgrpToPmbokDoc < ActiveRecord::Migration
  def change
    add_reference :pmbok_docs, :subprocess_group, index: true
  end
end
