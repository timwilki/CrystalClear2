#!/bin/bash
set -e

# Remove a potentially pre-existing server.pid for Rails.
rm -f /app/tmp/pids/server.pid

# Install dependencies if they're missing
bundle check || bundle install

# Run database migrations
bundle exec rails db:migrate

# Seed the database if it's empty
bundle exec rails db:seed

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"
