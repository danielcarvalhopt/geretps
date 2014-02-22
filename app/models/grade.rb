class Grade < ActiveRecord::Base
  belongs_to :delivery
  belongs_to :student

  validates :value, :delivery, presence: true
  validates :value, inclusion: 0..100

end
