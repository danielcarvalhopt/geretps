class Test < ActiveRecord::Base
  belongs_to :phase
  belongs_to :input, class_name: "Document"
  belongs_to :output, class_name: "Document"
  has_many :test_results

  validates :phase, presence: true

  def result_of delivery_id
    self.test_results.find_by(delivery_id: delivery_id)
  end
end
