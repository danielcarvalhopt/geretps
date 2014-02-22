class DeliveryFile < ActiveRecord::Base
  belongs_to :delivery
  belongs_to :document
end
