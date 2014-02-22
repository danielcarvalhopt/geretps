class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name
      t.references :institution, index: true, null: false
    end
  end
end
