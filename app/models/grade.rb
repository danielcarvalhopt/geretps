class Grade < ActiveRecord::Base
  belongs_to :delivery
  belongs_to :student
end
