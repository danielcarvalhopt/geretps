class CreateAssignedTeachers < ActiveRecord::Migration
  def change
    create_table :assigned_teachers do |t|
      t.references :teacher, index: true, null: false
      t.references :subject, index: true, null: false
    end
  end
end
