class CreateTests < ActiveRecord::Migration
  def change
    create_table :tests do |t|
      t.string :executable,null: false
      t.references :phase, index: true, null: false
      t.references :input, index: true, null: false
      t.references :output, index: true, null: false
    end
  end
end
