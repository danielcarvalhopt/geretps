class CreatePhases < ActiveRecord::Migration
  def change
    create_table :phases do |t|
      t.string :name
      t.text :description
      t.datetime :begin_date
      t.datetime :end_date
      t.boolean :open
      t.boolean :grades
      t.integer :value
      t.references :statement, index: true
      t.references :project, index: true
    end
  end
end
