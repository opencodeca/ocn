# news.opencode.ca

## Bootstrap the application

```
# Install the dependencies
$ bundle install

# Copy the environment file to your local machine
$ cp .env.default .env

# Create and bootstrap the database
$ bundle exec rake db:setup

# Run the application processes
$ bundle exec foreman start
```

For development purpose, you can run `bundle exec rake hn:import` to populate `Post`. It will import the Hacker News frontpage.

## Environment variables

```
# The environment for Rails to use
RACK_ENV=development

# The port on which we want to run the server
PORT=3000

# The canonical hostname for the application
CANONICAL_HOST=0.0.0.0

# Sentry (optional)
SENTRY_DSN=

# Database URL to use in non-development environment (remove otherwise)
DATABASE_URL=

# GitHub client infos
# Create your application at https://github.com/settings/applications
GITHUB_CLIENT_ID=
GITHUB_CLIENT_SECRET=
```

## Run tests

```
# Run the test suite
$ bundle exec rake spec
```
