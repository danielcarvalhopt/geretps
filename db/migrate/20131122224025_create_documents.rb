class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.string :name, null: false
      t.string :description
      t.text :notes
    end
  end
end
