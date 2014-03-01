class Group < ActiveRecord::Base
  belongs_to :project
  has_many :members
  has_many :students, through: :members
  has_many :assigned_notifications
  has_many :notifications, through: :assigned_notifications
  has_many :deliveries, order: 'created_at desc'

  validates :identifier, :project, presence: true

  def have_student student_id
    !self.students.find{|student| student.id == student_id}.nil?
  end
end
