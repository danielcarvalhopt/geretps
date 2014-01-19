class CreateProjectFiles < ActiveRecord::Migration
  def change
    create_table :project_files do |t|
      t.references :file, index: true, null: false
      t.references :project, index: true, null: false
    end
  end
end
