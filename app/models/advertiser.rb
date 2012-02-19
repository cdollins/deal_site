class Advertiser < ActiveRecord::Base
  belongs_to :publisher

  validates_presence_of :name
  validates_uniqueness_of :name

  validates_presence_of :publisher
end
