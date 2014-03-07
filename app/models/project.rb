class Project < ActiveRecord::Base
  belongs_to :subject
  belongs_to :statement, class_name: "Document"
  has_many :groups
  has_many :notifications, order: 'date desc'
  has_many :phases, order: 'begin_date asc'
  has_many :deliveries, through: :phases
  has_many :project_files
  has_many :files, through: :project_files

  validates :begin_date, :name, :subject, :statement, :min_elems, presence: true
  validates :begin_date, date: true
  validates :end_date, date: {after: :begin_date}, if: :end_date

  scope :active_projects, -> { where("begin_date < ? AND end_date > ?", DateTime.now, DateTime.now).sort_by{|project| project.send(:next_delivery) || DateTime.now} }
  scope :upcoming_projects, -> { where("begin_date > ?", DateTime.now).sort_by{|project| project.send(:next_delivery) || DateTime.now} }
  scope :latest_projects, -> { where("end_date < ?", DateTime.now).sort_by{|project| project.send(:next_delivery) || DateTime.now}.reverse }

  delegate :students, to: :subject

  def first_phase
    self.phases.first
  end

  def last_phase
    self.phases.last
  end

  def next_delivery
    self.phases.find{|phase| phase.end_date > DateTime.now}.try(:end_date) || self.end_date
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

  def grade student_id
    grade = 0
    self.phases.each do |phase|
      grade += phase.grade student_id
    end
    grade
  end

  def group_of student_id
    self.groups.find{|group| group.have_student student_id}
  end

  def deliveries_of group_id
    self.deliveries.where(group_id: group_id)
  end

  def current_phase
    self.phases.find{|phase| phase.active?}
  end

  def current_or_nearest_phase
    phase = self.current_phase
    phase ||= self.begin_date >= DateTime.now ? self.first_phase : self.last_phase
  end

  def students_without_group
    students = []
    self.students.each do |student|
      if self.group_of(student.id).nil?
        students << student
      end
    end
    students
  end
end
