class AssignedNotification < ActiveRecord::Base
  belongs_to :notification
  belongs_to :group
end
