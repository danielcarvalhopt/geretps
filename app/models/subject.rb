class Subject < ActiveRecord::Base
  belongs_to :course
  belongs_to :responsible, class_name: "Teacher"
end
