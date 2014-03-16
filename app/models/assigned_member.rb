class AssignedMember < ActiveRecord::Base
	belongs_to :group_activity
	belongs_to :member
end

