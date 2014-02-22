class CreateAssignedNotifications < ActiveRecord::Migration
  def change
    create_table :assigned_notifications do |t|
      t.references :group, index: true, null: false
      t.references :notification, index: true, null: false
    end
  end
end
