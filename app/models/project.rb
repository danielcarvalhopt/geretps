class Project < ActiveRecord::Base
  belongs_to :subject
  belongs_to :statement, class_name: "Document"
  has_many :groups
  has_many :notifications
  has_many :phases
  has_many :project_files
  has_many :files, through: :project_files

  validates :begin_date, :name, :subject, :statement, :min_elems, presence: true
  validates :begin_date, date: true
  validates :end_date, date: {after: :begin_date}, if: :end_date

  scope :active_projects, -> { where("begin_date < ? AND end_date > ?", DateTime.now, DateTime.now) }
  scope :upcoming_projects, -> { where("begin_date > ?", DateTime.now) }
  scope :latest_projects, -> { where("end_date < ?", DateTime.now) }
end
