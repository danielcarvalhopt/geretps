class Shift < ActiveRecord::Base
  belongs_to :subject
  has_many :assigned_students
  has_many :students, through: :assigned_students

  validates :name, :subject, presence: true
  validates :name, uniqueness: {scope: :subject}
end
