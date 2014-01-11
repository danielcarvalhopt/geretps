class Course < ActiveRecord::Base
  belongs_to :institution
  has_many :subjects
end
