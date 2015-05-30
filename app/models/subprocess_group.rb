class SubprocessGroup < ActiveRecord::Base
  belongs_to :process_group
  belongs_to :knowledge_area
  has_many :workflows , dependent: :destroy
end
