class CreateAssignedStudents < ActiveRecord::Migration
  def change
    create_table :assigned_students do |t|
      t.references :student, index: true, null: false
      t.references :subject, index: true, null: false
      t.references :shift, index: true
      t.boolean :accepted, default: false
    end
  end
end
