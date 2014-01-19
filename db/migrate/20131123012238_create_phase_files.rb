class CreatePhaseFiles < ActiveRecord::Migration
  def change
    create_table :phase_files do |t|
      t.references :file, index: true, null: false
      t.references :phase, index: true, null: false
    end
  end
end
