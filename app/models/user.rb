class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_attached_file :avatar, styles: { thumb: "100x100#" }, default_style: :thumb
  validates :email, presence: true, email: true, uniqueness: true
	validates :phone, phone: true, uniqueness: true
  validates :name, presence: true

  def student
    Student.where(user: self).first
  end

  def student?
    !student.nil?
  end

  def teacher
    Teacher.where(user: self).first
  end

  def teacher?
    !Teacher.nil?
  end

  def type
    student? ? "aluno" : "docente"
  end
end
