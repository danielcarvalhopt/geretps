class AddStatementToProjects < ActiveRecord::Migration
  def change
    add_reference :projects, :statement, index: true
  end
end
