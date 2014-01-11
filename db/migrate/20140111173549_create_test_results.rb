class CreateTestResults < ActiveRecord::Migration
  def change
    create_table :test_results do |t|
      t.references :test, index: true
      t.references :delivery, index: true
      t.text :diff
    end
  end
end
