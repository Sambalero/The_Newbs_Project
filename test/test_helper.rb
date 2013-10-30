require 'simplecov'
SimpleCov.start
ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require "capybara/rails" #delete this if capybara is not used; config capybara if it is
require 'rails/test_help'
require "mocha/setup"
require "simplecov"
require "minitest/autorun" 

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all

  # Add more helper methods to be used by all tests here...
end

# Transactional fixtures do not work with Selenium tests, because Capybara
# uses a separate server thread, which the transactions would be hidden
# from. We hence use DatabaseCleaner to truncate our test database.
DatabaseCleaner.strategy = :truncation

# If description name ends with 'integration', use this RequestSpec class.
# It has all the integration test goodies.
class RequestSpec < MiniTest::Spec
  include Rails.application.routes.url_helpers
  include Capybara::DSL
end
MiniTest::Spec.register_spec_type /integration$/i, RequestSpec

#---is the following in  conflict with the preceding?
class ActionDispatch::IntegrationTest
  # Make the Capybara DSL available in all integration tests
  include Capybara::DSL
  Capybara.current_driver = :selenium #trying to see what's going on2/19/13
#---- unable to obtain stable firefox connection...(127.0.0.1:7055)
# 

  # Stop ActiveRecord from wrapping tests in transactions
  self.use_transactional_fixtures = false

  teardown do
    DatabaseCleaner.clean       # Truncate the database
    Capybara.reset_sessions!    # Forget the (simulated) browser state
#    Capybara.use_default_driver # Revert Capybara.current_driver to Capybara.default_driver
  end
end