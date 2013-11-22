class AssignedStudent < ActiveRecord::Base
  belongs_to :student
  belongs_to :class
end
