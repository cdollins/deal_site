class Deal < ActiveRecord::Base
  belongs_to :advertiser

  validates_presence_of :advertiser, :value, :price, :description, :start_at, :end_at
end
