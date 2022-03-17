require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module SportsEventsApi
  # Application configs
  class Application < Rails::Application
    config.load_defaults 7.0

    config.i18n.default_locale = :"pt-BR"
    I18n.enforce_available_locales = false

    config.time_zone = 'Brasilia'

    config.api_only = true
  end
end
