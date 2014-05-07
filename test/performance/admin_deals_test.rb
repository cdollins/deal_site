require 'test_helper'
require 'rails/performance_test_help'

class AdminDealsTest < ActionDispatch::PerformanceTest
  # Refer to the documentation for all available options
  # self.profile_options = { :runs => 5, :metrics => [:wall_time, :memory]
  #                          :output => 'tmp/performance', :formats => [:flat] }

  def setup
    @deals = FactoryGirl.create_list(:deal, 1000)
  end
  

  def test_admin_deals
    get '/deals'
  end
end
