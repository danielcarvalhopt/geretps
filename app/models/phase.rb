class Phase < ActiveRecord::Base
  belongs_to :project
  belongs_to :statement, class_name: "File"
  has_many :required_files
  has_many :phase_files
  has_many :files, through: :phase_files
  has_many :tests
  has_many :deliveries


  validates :name, :description,:grades,:begin_date,:end_date,:open,presence: true
  validates :begin_date,date: {after_or_equal: Proc.new{Date.now}}
  validates :end_date,date: {after: :begin_date}
  validates :description, length: {maximum: 500}
  validates :grades,:open,inclusion: {in: [true,false]}




end
