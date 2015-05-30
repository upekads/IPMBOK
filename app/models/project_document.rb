class ProjectDocument < ActiveRecord::Base
  belongs_to :pmbok_doc
  belongs_to :project

  has_many :versions, dependent: :destroy

  has_many :tasks, dependent: :destroy

  has_attached_file :document

  def getFileNameWithNewVersion
    "#{docname}_#{(last_version.nil? ? 1 : (last_version.to_int + 1))}"
  end

  def getFileNameWithLastVersion
    "#{docname}_#{(last_version.nil? ? 1 : last_version)}"
  end

end
