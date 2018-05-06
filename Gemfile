source 'https://rubygems.org'




gem 'mp3_player'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.6'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use devise gem for authentication
gem 'devise'

# Use scrypt as password-based key derivation function 
gem 'devise-encryptable'
gem 'devise-scrypt'

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

gem 'rails-i18n'
gem 'devise-i18n'

# recaptcha gem for authentication
gem "recaptcha", require: "recaptcha/rails"

gem 'omniauth-facebook'

# image uploader
gem 'carrierwave'

# image resizer
gem 'mini_magick'

# Amazon S3 service
gem 'fog-aws'

gem 'will_paginate', '~> 3.1.0'
gem 'paperclip'

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Use sqlite3 as the database for Active Record
  gem 'sqlite3'

  # load env file
  gem 'dotenv-rails', :require => 'dotenv/rails-now'

  gem 'coveralls', require: false

  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  gem 'cucumber-rails', :require => false

  gem 'cucumber-rails-training-wheels'

  # database_cleaner is not required, but highly recommended
  gem 'database_cleaner'

  gem 'launchy'

  gem 'capybara'

  gem 'rspec-rails', '~> 3.7'

  gem 'guard-rspec'

  # Use FactoryBot gem for model data testing
  gem 'factory_bot_rails', '~> 4.0'

  # Fake data generator
  gem 'faker'

end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

group :production do
  gem 'pg', '~> 0.18.4'
  gem 'rails_12factor', '0.0.2'
end


ruby "2.3.0"
