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
    self.deliveries.find{|delivery| delivery.group.have_student(student_id) && delivery.evaluated}
  end

  def grade student_id
    last_evaluated_delivery = last_evaluated_delivery(student_id)
    if !last_evaluated_delivery.nil?
      grade = (last_evaluated_delivery.grade(student_id).value * self.value)/100
      (grade * 20) / 100
    end
  end

  def completed?
    self.end_date < DateTime.now
  end

  def active?
    self.end_date >= DateTime.now && self.begin_date <= DateTime.now
  end

  def status_color
    if self.completed?
      "text-success"
    elsif self.active?
      "text-warning"
    else
      "text-primary"
    end
  end

  def average
    sum = 0
    self.project.subject.students.each do |student|
      student_grade = self.grade student.id
      sum += student_grade if !student_grade.nil?
    end
    (sum/self.project.subject.students.count).round(2)
  end

  def groups_with_deliveries
    groups_with_deliveries = Set.new
    self.deliveries.reverse.each do |delivery|
      groups_with_deliveries.add(delivery.group)
    end
    groups_with_deliveries.to_a
  end

  def groups_without_deliveries
    self.project.groups.reverse - self.groups_with_deliveries
  end

  def deliveries_of group_id
    self.deliveries.where(group_id: group_id)
  end
end
