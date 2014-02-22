class Test < ActiveRecord::Base
  belongs_to :phase
  belongs_to :input, class_name: "Document"
  belongs_to :output, class_name: "Document"
  has_many :tests

  validates :diff, presence: true

  validates :input, :output, :phase, presence: true
end
