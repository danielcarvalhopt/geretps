class CreateAssignedTeachers < ActiveRecord::Migration
  def change
    create_table :assigned_teachers do |t|
      t.references :teacher, index: true
      t.references :subject, index: true
    end
  end
end
