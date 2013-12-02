source 'https://rubygems.org'
ruby '2.0.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.1'

# Use PostgreSQL
gem 'pg'

# Use github for login
gem 'omniauth'
gem 'omniauth-github'

# Use choices for custom rails settings
gem 'choices'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# Use Bootstrap for basic styling
gem 'compass-rails', github: 'Compass/compass-rails', branch: 'rails4-hack'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# Use foreman to launch app
gem 'foreman'

# Use dotenv to use environment variables
gem 'dotenv-rails'

# Use Unirest to explore the web
gem 'unirest'

# Use Sentry to log errors
gem 'sentry-raven', require: false

# Use Rack::CanonicalHost
gem 'rack-canonical-host'

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
gem 'jquery-turbolinks'

# Use FriendlyId to generate clean URLs
gem 'friendly_id', '>= 5.0.1'

# Use presenters because they're cool
gem 'bourgeois', '>= 0.1.5'

# Use kaminari to create pages and move from page 1 to 2 to 3 .. till end.
gem 'kaminari'

# Use gaffe to handle error pages
gem 'gaffe'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

group :development, :test do
  # Use RSpec for tests
  gem 'rspec-rails'

  # Use FactoryGirl instead of fixtures
  gem 'factory_girl_rails'

  # Use debugger to debug, duh.
  gem 'debugger'

  # Pretty spec output
  gem 'fivemat'
end

group :development do
  # Use better_errors for nicer rails error page
  gem 'better_errors'

  # Use binding_of_caller for rails live web debugging with better_errors
  gem 'binding_of_caller'

  # Remove asset lines from STDOUT
  gem 'quiet_assets'
end

group :test do
  # Use FFaker for (faster) random data
  gem 'ffaker'

  # Cleanup database during tests
  gem 'database_cleaner'
end

# Use puma as the app server
gem 'puma'

# Use hanzo for deployment
gem 'hanzo'

group :production do
  # Fix a few things on Heroku
  gem 'rails_12factor'
end

# Use parole to handle comments on a link
gem 'parole'

# Use emotions to handle feelings on a link
gem 'emotions', github: 'mirego/emotions', branch: 'feature/newly-expressed'

# Use Devise to handle users
gem 'devise'

# Use Pismo to fetch URLs metadata
gem 'pismo'
