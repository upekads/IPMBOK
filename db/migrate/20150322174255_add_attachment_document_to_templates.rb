class AddAttachmentDocumentToTemplates < ActiveRecord::Migration
  def self.up
    change_table :templates do |t|
      t.attachment :document
    end
  end

  def self.down
    remove_attachment :templates, :document
  end
end
