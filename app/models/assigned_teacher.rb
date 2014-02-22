class AssignedTeacher < ActiveRecord::Base
  belongs_to :teacher
  belongs_to :subject
end
