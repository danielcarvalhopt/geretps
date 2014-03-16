class GroupActivity < ActiveRecord::Base
	include PublicActivity::Common
	has_many :assigned_members
	has_many :members, through: :assigned_members
end
