class Teacher < ActiveRecord::Base
  belongs_to :user
  has_many :assigned_teachers
  has_many :subjects, through: :assigned_teachers

  validates :user, presence: true
  
  delegate :name, :about, :phone, :avatar, :teacher, :student?, :teacher?, :student, :teacher, :type, :email, to: :user
end
