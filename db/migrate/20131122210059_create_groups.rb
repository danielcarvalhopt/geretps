class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :identifier
      t.references :project, index: true
    end
  end
end
