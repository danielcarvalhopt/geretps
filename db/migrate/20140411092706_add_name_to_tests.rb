class AddNameToTests < ActiveRecord::Migration
  def change
    add_column :tests, :name, :string
  end
end
