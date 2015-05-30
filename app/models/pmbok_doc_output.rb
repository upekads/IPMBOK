class PmbokDocOutput < ActiveRecord::Base
  belongs_to :subprocess_group

  belongs_to :outputdocument, :class_name => 'PmbokDoc'
  belongs_to :document, :class_name => 'PmbokDoc'

end
