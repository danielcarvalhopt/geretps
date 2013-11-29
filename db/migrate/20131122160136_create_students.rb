class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :identifier
      t.references :user, index: true
    end
  end
end
