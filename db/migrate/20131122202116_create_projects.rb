class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name, null: false
      t.text :description
      t.datetime :begin_date
      t.datetime :end_date
      t.boolean :public, default: false
      t.boolean :grades, default: false
      t.boolean :open, default: false
      t.boolean :shift_group, default: false
      t.integer :max_elems
      t.integer :min_elems, null: false, default: 1
      t.references :subject, index: true
    end
  end
end
