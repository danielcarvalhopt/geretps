class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.string :name, null: false
      t.string :description
      t.text :notes
      t.boolean :active, default: false
    end
  end
end
