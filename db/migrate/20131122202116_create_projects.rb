class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.datetime :begin_date
      t.datetime :end_date
      t.boolean :public
      t.boolean :grades
      t.boolean :open
      t.integer :max_elems
      t.integer :min_elems
      t.references :subject, index: true
    end
  end
end
