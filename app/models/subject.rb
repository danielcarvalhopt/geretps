class Subject < ActiveRecord::Base
  belongs_to :course
  belongs_to :responsible, class_name: "Teacher"
  belongs_to :academic_year
  has_many :assigned_teachers
  has_many :teachers, through: :assigned_teachers
  has_many :assigned_students
  has_many :students, through: :assigned_students
  has_many :projects
  has_many :shifts

  validates :name, :academic_year, :responsible, presence: true
end
