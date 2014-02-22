class AcademicYear < ActiveRecord::Base
  has_many :subjects

  validates :academic_year, academic_year: true
end
