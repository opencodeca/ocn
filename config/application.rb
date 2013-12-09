require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module Ocnews
  class Application < Rails::Application
    # Load settings in config/settings.yml
    config.from_file 'settings.yml'

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    config.time_zone = 'Eastern Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    config.i18n.default_locale = :fr

    # Canonical host
    if Rails.configuration.domain
      config.middleware.use Rack::CanonicalHost, Rails.configuration.domain
    end

    # Google Analytics
    if Rails.configuration.google_analytics.tracker.present?
      config.middleware.use Rack::GoogleAnalytics, tracker: Rails.configuration.google_analytics.tracker, domain: Rails.configuration.google_analytics.domain, multiple: true
    end

    config.action_dispatch.rescue_responses.merge! 'DoubleLikeError' => :forbidden
  end
end
