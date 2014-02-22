class CreateAcademicYears < ActiveRecord::Migration
  def change
    create_table :academic_years do |t|
      t.string :academic_year
    end
  end
end
