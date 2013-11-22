class Group < ActiveRecord::Base
  belongs_to :project
  has_many :members
  has_many :students, through: :members
end
