class CreateOaiPmhRequests < ActiveRecord::Migration
  def change
    create_table :oai_pmh_requests do |t|
      t.string :verb
      t.string :resumption_code
      t.integer :cursor
      t.timestamps
    end
  end
end
