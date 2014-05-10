class CreateImports < ActiveRecord::Migration
  def change
    create_table :imports do |t|
      t.string :import_map
      t.integer :publisher_id

      t.timestamps
    end
  end
end
