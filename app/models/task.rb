class Task < ActiveRecord::Base
  belongs_to :project_document
  belongs_to :assignee, :class_name => 'User'
  belongs_to :assigned, :class_name => 'User'

end
