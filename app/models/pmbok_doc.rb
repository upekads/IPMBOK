class PmbokDoc < ActiveRecord::Base
  has_many :project_documents , dependent: :destroy
  has_many :workflows , dependent: :destroy
  has_many :templates , dependent: :destroy
  accepts_nested_attributes_for :templates, allow_destroy: true

  has_many :parent_document, :class_name => "PmbokDocInput", :foreign_key => "document_id"
  has_many :input_document, :class_name => "PmbokDocInput", :foreign_key => "inputdocument_id"

end
