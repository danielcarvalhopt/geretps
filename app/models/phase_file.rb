class PhaseFile < ActiveRecord::Base
  belongs_to :phase
  belongs_to :document
end
