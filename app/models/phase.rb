class Phase < ActiveRecord::Base
  belongs_to :project
  belongs_to :statement, class_name: "Document"
  has_many :required_files
  has_many :phase_files
  has_many :documents, through: :phase_files
  has_many :tests
  has_many :deliveries, order: "updated_at desc"

  validates :name, :begin_date, :project, presence: true
  validates :begin_date, date: true
  validates :end_date, date: {after: :begin_date}, if: :end_date

  def last_evaluated_delivery student_id
    self.deliveries.find{|delivery| delivery.group.has_student(student_id) && delivery.evaluated}
  end

  def final_grade student_id
    final_grade = (last_evaluated_delivery(student_id).grade(student_id).value * self.value)/100

    (final_grade * 20) / 100
  end
end
