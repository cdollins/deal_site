# See http://m.onkey.org/running-rails-performance-tests-on-real-data
# fixed to work with Rails 3.2.15
 
# START : HAX HAX HAX
# Load Rails environment in 'test' mode
ENV["RAILS_ENV"] ||= "test"
require File.expand_path('../../config/environment', __FILE__)
 
# Re-establish db connection for 'performance' mode
ActiveRecord::Base.establish_connection(:performance)
# STOP : HAX HAX HAX
 
require_dependency 'application_controller'
 
require 'test/unit'
require 'active_support/testing/performance'
require 'active_support/core_ext/kernel'
require 'active_support/test_case'
require 'action_controller/test_case'
require 'action_dispatch/testing/integration'
 
require 'rails/performance_test_help'
 
# You may want to turn off caching, if you're trying to improve non-cached rendering speed.
# Just uncomment this line:
# ActionController::Base.perform_caching = false