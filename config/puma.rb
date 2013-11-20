# Environment
environment ENV['RACK_ENV']

# Workers count
workers ENV['PUMA_WORKERS'] || 1

# Threads count per worker
min_threads = ENV['PUMA_MIN_THREADS'] || 0
max_threads = ENV['PUMA_MAX_THREADS'] || 5
threads min_threads, max_threads

# Preload the app
preload_app!

# Run code when a worker is spawned
on_worker_boot do
  # Set a global logger
  Rails.logger = ActiveSupport::Logger.new(STDOUT)

  # Disconnect ActiveRecord connection
  if defined?(ActiveRecord::Base)
    ActiveRecord::Base.connection.disconnect!
  end

  # Connect to ActiveRecord
  ActiveSupport.on_load(:active_record) do
    config = Rails.application.config.database_configuration[Rails.env]
    config['reaping_frequency'] = ENV['DB_REAP_FREQ'] || 10 # seconds
    config['pool'] = ENV['DB_POOL'] || 5 # connections

    ActiveRecord::Base.establish_connection(config)
    ActiveRecord::Base.logger = Rails.logger
  end
end
