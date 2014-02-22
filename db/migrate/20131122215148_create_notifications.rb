class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.string :title, null: false
      t.text :body, null: false
      t.datetime :date, null: false, default: Time.now
      t.references :project, index: true, null: false
    end
  end
end
