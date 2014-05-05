class Teacher < ActiveRecord::Base
  belongs_to :user
  has_many :assigned_teachers
  has_many :subjects, through: :assigned_teachers
  has_many :projects, through: :subjects
  has_many :notifications, through: :projects, order: 'date desc'
  has_many :academic_years, through: :subjects

  validates :user, presence: true

  delegate :name, :about, :phone, :avatar, :teacher, :student?, :teacher?, :student, :teacher, :type, :type_pt, :first_and_last_name, :email, to: :user
end
