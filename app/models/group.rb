class Group < ActiveRecord::Base
  include PublicActivity::Common
  belongs_to :project
  has_many :group_activities
  has_many :members
  has_many :students, through: :members
  has_many :assigned_notifications
  has_many :notifications, through: :assigned_notifications
  has_many :deliveries, order: 'created_at desc'

  validates :identifier, :project, presence: true
  validates :identifier, uniqueness: {scope: :project_id}

  def have_student student_id
    !self.students.find{|student| student.id == student_id}.nil?
  end

  def valid_nr?
    students_nr = self.students.count
    max_elems = self.project.max_elems
    min_elems = self.project.min_elems

    if students_nr >= min_elems and (max_elems.nil? or students_nr <= max_elems)
      true
    else
      false
    end
  end

  def evaluated phase_id
    evaluated = true
    self.students.each do |student|
      grade = Phase.find(phase_id).grade(student.id)
      evaluated = false if grade.nil?
    end
    evaluated
  end
end
