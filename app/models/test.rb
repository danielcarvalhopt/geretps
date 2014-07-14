class Test < ActiveRecord::Base
  belongs_to :phase
  belongs_to :input, class_name: "Document"
  belongs_to :output, class_name: "Document"
  has_many :test_results

  validates :phase, presence: true
  validates :input, presence: true
  validates :output, presence: true
  validates :executable, presence: true
  validates :name, presence: true

  def result_of delivery_id
    self.test_results.find_by(delivery_id: delivery_id)
  end

  def run(delivery)
    name = SecureRandom.hex
    `mkdir /tmp/#{name}`
    delivery.documents.each do |doc|
      `cp #{doc.file.path} /tmp/#{name}/`
    end
    `cd /tmp/#{name} ; make` if File.exist?("/tmp/#{name}/Makefile")
    `chmod +x /tmp/#{name}/#{executable}`
    `/tmp/#{name}/#{executable} < #{input.file.path} > /tmp/#{name}/out_#{name}`
    diff = `diff -y /tmp/#{name}/out_#{name} #{output.file.path}`
    `rm -rf /tmp/#{name}/`
    diff
  end

end
