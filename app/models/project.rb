class Project < ActiveRecord::Base
  belongs_to :subject
  belongs_to :statement, class_name: "File"
  has_many :groups
  has_many :notifications
  has_many :phases
  has_many :project_files
  has_many :files, through: :project_files


  validates :end_date,:begin_date,:grades,:name,:description,:open,:max_elems,:min_elems,:public,presence: true
  validates :begin_date, date:{after_or_equal: Proc.new{Date.now}}
  validates :end_date, date:{after: :begin_date}
  validates :grades,:open,:public , inclusion: {in:[true,false]}
  validates :description, length: {maximum: 500}
  validates :min_elems, numericality: {only_integer: true, greater_than_or_equal_to: 1}
  validates :max_elems, numericality: {only_integer: true, greater_than_or_equal_to: :min_elems}





end
