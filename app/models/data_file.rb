class DataFile < ActiveRecord::Base

  has_attached_file :document,

  :path => ':rails_root/tmp/upload/:id/:basename.:extension'
 # validates_attachment_content_type :document, :content_type => /\Aimage\/.*\Z/
  validates_attachment :document, :content_type => { :content_type => %w(application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document) }

end
