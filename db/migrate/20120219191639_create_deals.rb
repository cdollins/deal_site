class CreateDeals < ActiveRecord::Migration
  def change
    create_table :deals do |t|
      t.string :proposition
      t.integer :value
      t.integer :price
      t.integer :advertiser_id
      t.text :description
      t.datetime :expires_at
      t.boolean :sold_out

      t.timestamps
    end
  end
end
