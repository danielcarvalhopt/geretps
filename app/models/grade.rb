class Grade < ActiveRecord::Base
  belongs_to :delivery
  belongs_to :student

  validates :value , :comments , presence: true
  validates :value , numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 100}
  validates :comments, length: {maximum: 500}

end
