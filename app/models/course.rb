class Course < ActiveRecord::Base
  belongs_to :institution
  has_many :subjects

  validates :name, presence: true
  validates :institution, presence: true

end
