class AddFileToDocuments < ActiveRecord::Migration
  def change
    add_attachment :documents, :file
  end
end
