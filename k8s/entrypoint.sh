#!/bin/bash

# Reseting Environment
#bin/rails db:create

# Run DB migration
bin/rails db:migrate
#bin/rails db:seed

gem install bundler --version 1.17.3

bundle exec whenever --update-crontab

service cron start

# Start service
bundle exec puma -t 5:5 -p ${PORT:-3003} -e ${RACK_ENV}
