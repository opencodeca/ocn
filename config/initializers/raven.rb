if Rails.configuration.sentry.dsn.present?
  require 'raven'

  Raven.configure do |config|
    config.dsn = Rails.configuration.sentry.dsn
  end
end
