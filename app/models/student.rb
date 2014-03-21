class Student < ActiveRecord::Base
  belongs_to :user
  has_many :assigned_students_all, class_name: "AssignedStudent"
  has_many :assigned_students, -> { where accepted: true }
  has_many :assigned_students_not_accepted, -> { where accepted: false }, class_name: "AssignedStudent"
  has_many :subjects, through: :assigned_students
  has_many :subjects_all, through: :assigned_students_all, source: :subject
  has_many :waiting_subjects, through: :assigned_students_not_accepted, source: :subject
  has_many :members
  has_many :groups, through: :members
  has_many :grades
  has_many :projects, through: :subjects
  has_many :notifications, through: :projects, order: 'date desc'
  has_many :academic_years, through: :subjects

  validates :identifier, :user, presence: true

  delegate :name, :about, :phone, :avatar, :teacher, :student?, :teacher?, :student, :teacher, :type, :type_pt, :first_and_last_name, :email, to: :user
end
