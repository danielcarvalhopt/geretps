class TestResult < ActiveRecord::Base
  belongs_to :delivery
  belongs_to :test
end
