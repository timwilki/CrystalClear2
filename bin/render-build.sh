#!/usr/bin/env bash
# exit on error
set -o errexit

bundle install
# Avoid requiring real SECRET_KEY_BASE during build
SECRET_KEY_BASE_DUMMY=1 bundle exec rails assets:precompile
bundle exec rails assets:clean
bundle exec rails db:migrate
