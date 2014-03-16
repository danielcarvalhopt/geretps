class CreateGroupActivities < ActiveRecord::Migration
  def change
    create_table :group_activities do |t|
    	t.references :group, index: true
    end
  end
end
