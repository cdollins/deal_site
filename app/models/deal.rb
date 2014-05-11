class Deal < ActiveRecord::Base
  belongs_to :advertiser
  has_many :issues

  validates_presence_of :advertiser, :value, :price, :description, :start_at, :end_at
  validate :end_at_can_not_be_before_start_at
  
  after_save {issues.map(&:delete)}
    
  def end_at_can_not_be_before_start_at
    if end_at < start_at
      errors.add(:end_at, "cannot be before deal start_at")
    end
  end

  def over?
    Time.zone.now > end_at
  end

  def savings_as_percentage
    0.5
  end

  def savings
    20
  end
end
