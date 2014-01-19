class CreatePhases < ActiveRecord::Migration
  def change
    create_table :phases do |t|
      t.string :name, null: false
      t.text :description
      t.datetime :begin_date, null: false, default: Time.now
      t.datetime :end_date
      t.boolean :open, default: false
      t.boolean :grades, default: false
      t.integer :value
      t.references :statement, index: true
      t.references :project, index: true, null: false
    end
  end
end
