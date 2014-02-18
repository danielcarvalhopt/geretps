class Document < ActiveRecord::Base
  has_attached_file :file
  validates :name, presence: true
end
