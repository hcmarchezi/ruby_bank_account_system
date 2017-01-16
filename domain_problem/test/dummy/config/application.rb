require_relative 'boot'

# Pick the frameworks you want:
require "active_record/railtie"
require "action_controller/railtie"
require "action_view/railtie"
# require "action_mailer/railtie"
require "active_job/railtie"
# require "action_cable/engine"
require "rails/test_unit/railtie"
# require "sprockets/railtie"

require "factory_girl_rails"

Bundler.require(*Rails.groups)
require "domain_problem"

module Dummy
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Only loads a smaller set of middleware suitable for API only apps.
    # Middleware like session, flash, cookies can be added back manually.
    # Skip views, helpers and assets when generating a new resource.
    config.api_only = true

	FactoryGirl.definition_file_paths = %w(../factories/**)
	#FactoryGirl.find_definitions
	FactoryGirl.reload
	# You can use this line to see what factories are loaded

	puts "Dummy app - initlization !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!111"
	puts Rails.root
	puts FactoryGirl.factories
	puts '-------------------------------------------------------'


  end
end

