class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name
      t.integer :academic_year
      t.references :institution, index: true
    end
  end
end
