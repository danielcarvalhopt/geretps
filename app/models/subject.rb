class Subject < ActiveRecord::Base
  belongs_to :course
  belongs_to :responsible, class_name: "Teacher"
  belongs_to :academic_year
  has_many :assigned_teachers
  has_many :teachers, through: :assigned_teachers
  has_many :assigned_students, -> { where accepted: true }
  has_many :assigned_students_all, class_name:"AssignedStudent"
  has_many :assigned_students_not_accepted, -> { where accepted: false }, class_name:"AssignedStudent"
  has_many :students, through: :assigned_students
  has_many :waiting_students, through: :assigned_students_not_accepted, source: :student
  has_many :students_all, through: :assigned_students_all, source: :student
  has_many :projects
  has_many :shifts

  validates :name, :academic_year, :responsible, presence: true

  fuzzily_searchable :name

  def isResponsible?(user)
    self.responsible.id == user.teacher.id
  end

  def freeTeachers
    Teacher.where("id not in (?)",self.teacher_ids)
  end

  def freeStudents
    Student.where(id: self.student_ids)
  end

end
