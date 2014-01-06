class Student < ActiveRecord::Base
  belongs_to :user
  has_many :assigned_students
  has_many :subjects, through: :assigned_students
  has_many :members
  has_many :groups, through: :members
  has_many :grades

  validates :identifier, presence: true
end
