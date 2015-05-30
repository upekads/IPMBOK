class PmbokDocInput < ActiveRecord::Base
  belongs_to :subprocess_group
  belongs_to :inputdocument, :class_name => 'PmbokDoc'
  belongs_to :document, :class_name => 'PmbokDoc'

  has_many :own_document, :class_name => "PmbokDocOutput", :foreign_key => "document_id"
  has_many :output_document, :class_name => "PmbokDocOutput", :foreign_key => "outputdocument_id"


end
