require 'rubygems'
require 'spork'


Spork.prefork do
  def fix_devise_user_caching
    Spork.trap_method(Rails::Application, :reload_routes!)
  end

  ENV["RAILS_ENV"] ||= 'test'
  # Loading more in this block will cause your tests to run faster. However,
  # if you change any configuration or code from libraries loaded here, you'll
  # need to restart spork for it take effect.
  require File.expand_path("../../config/environment", __FILE__)
  require 'rspec/rails'
  require 'shoulda/integrations/rspec2' # shoulda matchers like  should validate_presence_of(:name)
  fix_devise_user_caching
  # Requires supporting ruby files with custom matchers and macros, etc,
  # in spec/support/ and its subdirectories.
  Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}
  RSpec.configure do |config|
    config.mock_with :rspec

    config.use_transactional_fixtures = true
  end
end

Spork.each_run do
  # This code will be run each time you run your specs.

end
