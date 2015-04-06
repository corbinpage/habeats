source 'https://rubygems.org'

ruby '2.1.2'

# Newest rails 
gem 'rails', '4.1.6'
# Postgresql Database
gem 'pg'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',          group: :doc
# User authentication
gem 'devise'
# Hide secret keys, please request a copy of config/application.yml
gem 'figaro', '>= 1.0.0.rc1'
# Allow files to be attached, not currenly being used
gem "paperclip"
# Connect to Google Cloud Storage
gem "fog"
# Collect Credit Card information and get paid
gem 'stripe', :git => 'https://github.com/stripe/stripe-ruby'
# Mailgun
gem 'mailgun-ruby', '~>1.0.3', require: 'mailgun'

## CSS ##
# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.3'
# Bootstrap 3.2 or greater
gem 'bootstrap-sass'
# Home page includes images for font awesome
gem 'font-awesome-rails'
# Pagination
gem 'will_paginate-bootstrap'
# Creates nice calendar and time pickers for entering datetimes
gem 'bootstrap3-datetimepicker-rails', '~> 3.1.3'
# Dependent library for the datetimepicker
gem 'momentjs-rails' 

## JavaScript ##
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'
# Use jquery as the JavaScript library
gem 'jquery-rails'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'

group :development do
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring' 
  gem 'better_errors'
  gem 'binding_of_caller', :platforms=>[:mri_21]
  gem 'quiet_assets'
  gem 'rails_apps_pages'
  gem 'rails_apps_testing'
  gem 'rails_layout'
  gem 'sqlite3'
end

group :development, :test do
  gem 'factory_girl_rails'
  gem 'faker'
  gem 'pry-rails'
  gem 'pry-rescue'
  gem 'rspec-rails'
  gem 'forward'
  gem 'vcr'
end

group :test do
  gem 'capybara'
  gem 'database_cleaner'
  gem 'launchy'
  gem 'selenium-webdriver'
end

group :production do
  gem 'rails_12factor' # Deploy with Heroku
end