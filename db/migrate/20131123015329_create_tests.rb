class CreateTests < ActiveRecord::Migration
  def change
    create_table :tests do |t|
      t.references :phase, index: true
      t.references :input, index: true
      t.references :output, index: true
    end
  end
end
