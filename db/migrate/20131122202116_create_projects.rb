class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.datetime :begin_date
      t.datetime :end_date
      t.references :subject, index: true
    end
  end
end
