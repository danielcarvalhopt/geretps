class CreateAssignedStudents < ActiveRecord::Migration
  def change
    create_table :assigned_students do |t|
      t.references :student, index: true
      t.references :subject, index: true
    end
  end
end
