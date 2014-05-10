class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.integer :publisher_id
      t.integer :import_id
      t.integer :deal_id
      t.string :message

      t.timestamps
    end
  end
end
