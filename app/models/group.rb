class Group < ActiveRecord::Base
  belongs_to :project
  has_many :members
  has_many :students, through: :members
  has_many :assigned_notifications
  has_many :notifications, through: :assigned_notifications
  has_many :deliveries

  validates :identifier, :project, presence: true

  def has_student student_id
    student = self.students.find{|student| student.id == student_id}
    !student.nil?
  end
end
