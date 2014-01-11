class CreateDeliveryFiles < ActiveRecord::Migration
  def change
    create_table :delivery_files do |t|
      t.references :delivery, index: true
      t.references :file, index: true
    end
  end
end
