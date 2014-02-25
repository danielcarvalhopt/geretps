class Project < ActiveRecord::Base
  belongs_to :subject
  belongs_to :statement, class_name: "Document"
  has_many :groups
  has_many :notifications
  has_many :phases, order: 'begin_date asc'
  has_many :project_files
  has_many :files, through: :project_files

  validates :begin_date, :name, :subject, :statement, :min_elems, presence: true
  validates :begin_date, date: true
  validates :end_date, date: {after: :begin_date}, if: :end_date

  scope :active_projects, -> { where("begin_date < ? AND end_date > ?", DateTime.now, DateTime.now).sort_by{|project| project.send(:next_delivery) || DateTime.now} }
  scope :upcoming_projects, -> { where("begin_date > ?", DateTime.now).sort_by{|project| project.send(:next_delivery) || DateTime.now} }
  scope :latest_projects, -> { where("end_date < ?", DateTime.now).sort_by{|project| project.send(:next_delivery) || DateTime.now}.reverse }

  def first_phase
    self.phases.first
  end

  def last_phase
    self.phases.last
  end

  def next_delivery
    next_delivery = self.phases.find{|phase| phase.end_date > DateTime.now}.try(:end_date)
    next_delivery ||= self.end_date
    next_delivery
  end

  def completed_phases
    self.phases.where("end_date > ?", DateTime.now)
  end

  def completed_phases_nr
    self.completed_phases.count
  end

  def next_phase_nr
    self.completed_phases.count+1
  end

  def phases_nr
    count = self.phases.count
    count == 0 ? 1 : count
  end

  def final_grade student_id
    final_grade = 0

    self.phases.each do |phase|
      final_grade += (phase.last_evaluated_delivery(student_id).grade(student_id).value * phase.value)/100
    end

    (final_grade * 20) / 100
  end
end
