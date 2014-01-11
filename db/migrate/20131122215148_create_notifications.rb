class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.string :title
      t.text :body
      t.datetime :date
      t.references :project, index: true
    end
  end
end
