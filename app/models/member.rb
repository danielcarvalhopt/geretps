class Member < ActiveRecord::Base
  belongs_to :student
  belongs_to :group
  has_many :assigned_members
  has_many :group_activities, through: :assigned_members
end
