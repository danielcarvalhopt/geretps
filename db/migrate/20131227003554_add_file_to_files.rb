class AddFileToFiles < ActiveRecord::Migration
  def change
    add_attachment :files, :file
  end
end
