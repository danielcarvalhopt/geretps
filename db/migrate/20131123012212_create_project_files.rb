class CreateProjectFiles < ActiveRecord::Migration
  def change
    create_table :project_files do |t|
      t.references :file, index: true
      t.references :project, index: true
    end
  end
end
