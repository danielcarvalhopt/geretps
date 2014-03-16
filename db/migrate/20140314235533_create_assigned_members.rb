class CreateAssignedMembers < ActiveRecord::Migration
  def change
    create_table :assigned_members do |t|
    	t.references :group_activity, index: true
    	t.references :member, index: true
    end
  end
end
