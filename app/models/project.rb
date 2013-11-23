class Project < ActiveRecord::Base
  belongs_to :subject
  belongs_to :statement, class_name: "File"
  has_many :groups
  has_many :notifications
  has_many :phases
  has_many :project_files
  has_many :files, through: :project_files
end
