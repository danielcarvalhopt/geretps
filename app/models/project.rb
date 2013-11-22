class Project < ActiveRecord::Base
  belongs_to :subject
  has_many :groups
end
