RAILS_GEM_VERSION = '2.3.8' unless defined? RAILS_GEM_VERSION

# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Tlocards::Application.initialize!
