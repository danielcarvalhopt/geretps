class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.string :name, null: false
      t.references :course, index: true, null: false
      t.references :responsible, index: true, null: false
      t.references :academic_year, index: true, null: false
    end
  end
end
