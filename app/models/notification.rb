class Notification < ActiveRecord::Base
  belongs_to :project
  has_many :assigned_notifications
  has_many :groups, through: :assigned_notifications

  validates :title, :body, :date , presence: true
  validates :date, date: true
end
