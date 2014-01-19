class CreateRequiredFiles < ActiveRecord::Migration
  def change
    create_table :required_files do |t|
      t.string :name, null: false
      t.text :description
      t.references :phase, index: true, null: false
    end
  end
end
