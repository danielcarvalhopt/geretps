class Teacher < ActiveRecord::Base
  belongs_to :user
  has_many :assigned_teachers
  has_many :subjects, through: :assigned_teachers
end
