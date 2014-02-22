class RequiredFile < ActiveRecord::Base
  belongs_to :phase
  validates :name, :phase, presence: true
end
