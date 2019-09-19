require_relative 'boot'

require 'rails/all'

require 'jp_prefecture'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Enjoyeigo
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    config.logger = Logger.new(STDOUT)

    #config.i18n.default_locale = :ja
    config.i18n.fallbacks = [:ja]


    config.action_controller.action_on_unpermitted_parameters = :raise
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
