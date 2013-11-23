class Group < ActiveRecord::Base
  belongs_to :project
  has_many :members
  has_many :students, through: :members
  has_many :assigned_notifications
  has_many :notifications, through: :assigned_notifications
end
