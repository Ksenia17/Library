require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)


module Lib
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1
    config.active_job.queue_adapter = :delayed_job
    config.assets.initialize_on_precompile = false
    config.time_zone = 'Kyiv'
    config.i18n.available_locales = [:ru, :en]
    config.i18n.default_locale = :ru
    #config.action_controller.permit_all_parameters = false
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
