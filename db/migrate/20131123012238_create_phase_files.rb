class CreatePhaseFiles < ActiveRecord::Migration
  def change
    create_table :phase_files do |t|
      t.references :file, index: true
      t.references :phase, index: true
    end
  end
end
