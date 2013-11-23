class CreateGrades < ActiveRecord::Migration
  def change
    create_table :grades do |t|
      t.float :value
      t.text :comments
      t.references :delivery, index: true
      t.references :student, index: true
    end
  end
end
