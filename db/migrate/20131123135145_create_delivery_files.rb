class CreateDeliveryFiles < ActiveRecord::Migration
  def change
    create_table :delivery_files do |t|
      t.references :delivery, index: true, null: false
      t.references :file, index: true, null: false
    end
  end
end
