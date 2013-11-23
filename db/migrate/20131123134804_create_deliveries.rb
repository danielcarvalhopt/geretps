class CreateDeliveries < ActiveRecord::Migration
  def change
    create_table :deliveries do |t|
      t.text :description
      t.references :phase, index: true
      t.references :group, index: true
      t.references :statement, index: true
    end
  end
end
