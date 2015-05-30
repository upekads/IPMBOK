class Workflow < ActiveRecord::Base
  belongs_to :subprocess_group
  belongs_to :pmbok_doc
end
