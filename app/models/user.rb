class User < ActiveRecord::Base
# Include default devise modules. Others available are:
# :token_authenticatable, :confirmable,
# :lockable, :timeoutable and :omniauthable

  #### Pop comment for disable devise
 # devise :database_authenticatable, :registerable,
  #       :recoverable, :rememberable, :trackable, :validatable

  belongs_to :role
  has_many :templates , dependent: :nullify
  has_many :task_assignee, :class_name => "Task", :foreign_key => "assignee_id"
  has_many :task_assigned, :class_name => "Task", :foreign_key => "assigned_id"


  def self.all_without(excluded)
    where("id NOT IN (?)", excluded)
  end

  def self.all_only(included)
    where("id IN (?)", included)
  end

  def fullName
    "#{firstname} #{lastname}"
  end
end
