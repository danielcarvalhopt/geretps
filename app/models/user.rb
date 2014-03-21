class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_attached_file :avatar, styles: { thumb: "100x100#" }, default_style: :thumb, default_url: :set_default_url
  validates :email, presence: true, email: true, uniqueness: true
	validates :phone, phone: true, uniqueness: true
  validates :name, presence: true

  def student
    Student.where(user: self).first
  end

  def student?
    !self.student.nil?
  end

  def teacher
    Teacher.where(user: self).first
  end

  def teacher?
    !self.teacher.nil?
  end

  def type
    self.student? ? "student" : "teacher"
  end

  def type_pt
    self.student? ? "aluno" : "docente"
  end

  def set_default_url
    if self.student?
      "/assets/avatars/student.png"
    else
      "/assets/avatars/teacher.png"
    end
  end

  def first_and_last_name
    words = self.name.split(' ')
    "#{words[0]} #{words[-1]}" if words.count > 1
  end
end
