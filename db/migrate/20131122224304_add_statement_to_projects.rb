class AddStatementToProjects < ActiveRecord::Migration
  def change
    add_reference :projects, :statement, index: true, null: false
  end
end
