require 'action_view'
include ActionView::Helpers::DateHelper

class Notification < ActiveRecord::Base
  belongs_to :project
  has_many :assigned_notifications
  has_many :groups, through: :assigned_notifications

  validates :title, :body, :date, :project, presence: true
  validates :date, date: true

  def ago
    distance_of_time_in_words(DateTime.now, self.date)
  end
end
