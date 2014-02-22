class CreateTestResults < ActiveRecord::Migration
  def change
    create_table :test_results do |t|
      t.references :test, index: true, null: false
      t.references :delivery, index: true, null: false
      t.text :diff
    end
  end
end
