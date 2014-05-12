class Delivery < ActiveRecord::Base
  include PublicActivity::Common

  belongs_to :phase
  belongs_to :group
  belongs_to :statement, class_name: "Document"
  has_many :delivery_files
  has_many :documents, through: :delivery_files
  has_many :grades
  has_many :test_results

  validates :description, presence: true

  # default_scope order('deliveries.begin_date')

  def grade student_id
    self.grades.where(student_id: student_id).first
  end

  def grade_comments student_id
    self.grade(student_id).try(:comments)
  end

  def grade_value student_id
    self.grade(student_id).try(:value).try(:to_i)
  end

end
