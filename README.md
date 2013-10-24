# news.opencode.ca

## Bootstrap the application

```
# Install the dependencies
$ bundle install

# Copy the environment file to your local machine
$ cp .env.default .env

# Run the application processes
$ bundle exec foreman start
```

# Environment variables

```
# The environment for Rails to use
RACK_ENV=development

# The port on which we want to run the server
PORT=3000

# The canonical hostname for the application
CANONICAL_HOST=0.0.0.0

# Sentry
SENTRY_DSN=

# Database URL to use in non-development environment (remove otherwise)
DATABASE_URL=
```

# Run tests

```
# Run the test suite
$ bundle exec rspec
```
