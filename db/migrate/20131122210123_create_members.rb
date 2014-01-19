class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.references :student, index: true, null: false
      t.references :group, index: true, null: false
    end
  end
end
