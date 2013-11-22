class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.string :name
      t.references :course, index: true
      t.references :responsible, index: true
    end
  end
end
