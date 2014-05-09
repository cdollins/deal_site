require 'test_helper'

class DealTest < ActiveSupport::TestCase
  test "factory should be sane" do
    assert FactoryGirl.build(:deal).valid?
  end

  test "over should honor current time" do
    now = Time.zone.now
    deal = FactoryGirl.create(:deal, :end_at => now + 1.week)
    Timecop.travel(now + 1.week - 1.second)
    assert !deal.over?, "Deal should not be over"

    Timecop.travel(now + 1.week + 1.second)
  	assert deal.over?, "Deal should be over"

    # Deal is only good strictly before end_at
    Timecop.travel(now + 1.week)
    assert deal.over?, "Deal should not be over"
  end
end
