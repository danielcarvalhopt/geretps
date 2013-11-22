class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.references :student, index: true
      t.references :group, index: true
    end
  end
end
