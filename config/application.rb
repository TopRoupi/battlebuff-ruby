# frozen_string_literal: true

require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Battlebuff
  class Application < Rails::Application # rubocop:disable Style/Documentation
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0
    config.i18n.default_locale = 'pt-BR'
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    config.generators.system_tests = nil
    config.add_autoload_paths_to_load_path = true

    # config.generators do |g|
    #   g.test_framework :rspec,
    #                    view_specs: false,
    #                    controller_specs: false,
    #                    helper_specs: false,
    #                    routing_specs: false,
    #                    request_specs: false
    # end
  end
end
