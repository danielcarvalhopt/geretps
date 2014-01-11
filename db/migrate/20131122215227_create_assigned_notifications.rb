class CreateAssignedNotifications < ActiveRecord::Migration
  def change
    create_table :assigned_notifications do |t|
      t.references :group, index: true
      t.references :notification, index: true
    end
  end
end
