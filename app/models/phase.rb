class Phase < ActiveRecord::Base
  belongs_to :project
  belongs_to :statement, class_name: "File"
  has_many :required_files
  has_many :phase_files
  has_many :files, through: :phase_files
end
