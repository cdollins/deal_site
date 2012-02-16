class Publisher < ActiveRecord::Base
  belongs_to :parent, class_name: "Publisher"
  has_many :publishers, foreign_key: :parent_id
end
