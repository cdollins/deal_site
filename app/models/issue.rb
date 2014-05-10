class Issue < ActiveRecord::Base
  belongs_to :import
  belongs_to :deal
  belongs_to :publisher
end
