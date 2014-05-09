class AssignedStudent < ActiveRecord::Base
  belongs_to :student
  belongs_to :subject
  belongs_to :shift

  delegate :name, to: :student

end
