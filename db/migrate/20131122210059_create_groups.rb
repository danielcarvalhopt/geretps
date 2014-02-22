class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :identifier, null: false
      t.references :project, index: true, null: false
    end
  end
end
