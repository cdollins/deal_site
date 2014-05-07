class AddIndexToPublisherAndAdvertiser < ActiveRecord::Migration
  def change
    add_index(:advertisers, :publisher_id)
  end
end
