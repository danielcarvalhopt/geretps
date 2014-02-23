class Student < ActiveRecord::Base
  belongs_to :user
  has_many :assigned_students
  has_many :subjects, through: :assigned_students
  has_many :members
  has_many :groups, through: :members
  has_many :grades
  has_many :projects, through: :subjects
  has_many :notifications, through: :projects
  has_many :academic_years, through: :subjects

  validates :identifier, :user, presence: true

  delegate :name, :about, :phone, :avatar, :teacher, :student?, :teacher?, :student, :teacher, :type, to: :user

end
