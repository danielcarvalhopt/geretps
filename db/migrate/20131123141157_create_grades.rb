class CreateGrades < ActiveRecord::Migration
  def change
    create_table :grades do |t|
      t.float :value, precision: 5, scale: 2, null: false
      t.text :comments
      t.references :delivery, index: true, null: false
      t.references :student, index: true#, null: false
    end
  end
end
