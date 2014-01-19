class CreateShifts < ActiveRecord::Migration
  def change
    create_table :shifts do |t|
      t.string :name, null: false
      t.references :subject, index: true, null: false
    end
  end
end
