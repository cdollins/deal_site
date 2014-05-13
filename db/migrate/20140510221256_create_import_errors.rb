class CreateImportErrors < ActiveRecord::Migration
  def change
    create_table :import_errors do |t|
      t.string :data
      t.string :error
      t.integer :import_id

      t.timestamps
    end
  end
end
