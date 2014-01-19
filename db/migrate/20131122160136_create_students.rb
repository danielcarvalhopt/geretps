class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :identifier, null: false
      t.references :user, index: true
    end
  end
end
