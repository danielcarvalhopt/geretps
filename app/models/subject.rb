class Subject < ActiveRecord::Base
  belongs_to :course
  belongs_to :responsible, class_name: "Teacher"
  has_many :assigned_teachers
  has_many :teachers, through: :assigned_teachers
  has_many :assigned_students
  has_many :students, through: :assigned_students
  has_many :projects
  has_many :shifts

  validates :name,:academic_year , presence: true
  validates :academic_year, academic_year: true

end
