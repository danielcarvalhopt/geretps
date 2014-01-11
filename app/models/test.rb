class Test < ActiveRecord::Base
  belongs_to :phase
  belongs_to :input, class_name: "File"
  belongs_to :output, class_name: "File"
  has_many :tests
end
