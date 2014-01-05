class Delivery < ActiveRecord::Base
  belongs_to :phase
  belongs_to :group
  belongs_to :statement, class_name: "File"
  has_many :delivery_files
  has_many :files, through: :delivery_files
  has_many :grades

  validates :description, :grades, :public, presence: true
  validates :description , length: { maximum: 500 }
  validates :grades ,:public , inclusion: { in: [true, false] }


end
