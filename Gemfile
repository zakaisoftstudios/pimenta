source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

########### PROJECT GEMS ###########
gem 'rswag-api'
gem 'rswag-ui'
gem 'knock'
gem 'bcrypt', '~> 3.1.7'
gem 'awesome_print'
gem 'json-serializer'
gem 'rack-cors', require: 'rack/cors'
gem 'carrierwave', '~> 1.0'
gem 'carrierwave-base64'
gem 'cloudinary'
gem 'faker'
gem 'geocoder'
gem 'searchkick'
gem 'redis', '~> 3.0'
gem 'sidekiq'
gem 'figaro'
gem 'geo_names'
gem 'kaminari'
gem 'koala'
gem 'validates_timeliness', '~> 5.0.0.alpha3'
gem 'blueprinter'
gem 'yajl-ruby', require: 'yajl'
gem 'amoeba'
gem 'validate_url'
gem 'http_accept_language'
gem 'sidekiq-cron', '~> 1.1'
gem 'awesome_rails_console'
gem 'pry'
gem 'whenever', require: false
gem "sentry-raven"

group :development do
  gem 'guard-rspec', require: false
  gem 'spring-commands-rspec'
  gem 'annotate'
  gem 'ruby-debug-ide'
  gem 'debase', '~> 0.2.4.1'
end

group :test do
  gem 'rspec-rails', '~> 3.7'
  gem 'factory_bot_rails', '~> 4.0'
  gem 'database_cleaner'
end

group :development, :test do
  gem 'bullet'
  gem 'rswag-specs'
  gem 'byebug'
  gem 'pry'
  gem 'letter_opener'
end

########### DEFAULT GEMS ###########

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.7'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
gem 'puma', '~> 3.0'

group :development do
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end
