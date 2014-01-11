class Notification < ActiveRecord::Base
  belongs_to :project
  has_many :assigned_notifications
  has_many :groups, through: :assigned_notifications
end
