class PhaseFile < ActiveRecord::Base
  belongs_to :phase
  belongs_to :file
end
