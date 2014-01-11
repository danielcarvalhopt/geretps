class CreateRequiredFiles < ActiveRecord::Migration
  def change
    create_table :required_files do |t|
      t.string :name
      t.text :description
      t.references :phase, index: true
    end
  end
end
