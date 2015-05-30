class AddAttachmentDocumentToDataFiles < ActiveRecord::Migration
  def self.up
    change_table :data_files do |t|
      t.attachment :document
    end
  end

  def self.down
    remove_attachment :data_files, :document
  end
end
