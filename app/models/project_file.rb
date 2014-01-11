class ProjectFile < ActiveRecord::Base
  belongs_to :project
  belongs_to :file
end
