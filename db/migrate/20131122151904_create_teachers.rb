class CreateTeachers < ActiveRecord::Migration
  def change
    create_table :teachers do |t|
      t.references :user, index: true, null: false
    end
  end
end
