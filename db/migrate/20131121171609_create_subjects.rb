class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.string :name
      t.string :academic_year
      t.references :course, index: true
      t.references :responsible, index: true
    end
  end
end