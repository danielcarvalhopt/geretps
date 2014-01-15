class File < ActiveRecord::Base
  validates :name, presence: true
end
