# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.2'

gem 'activestorage-cloudinary-service'
gem 'ahoy_matey'
gem 'bootsnap', '>= 1.4.2', require: false
gem 'cloudinary'
gem 'devise'
gem 'flipper-active_record'
gem 'flipper-ui'
gem 'geocoder'
gem 'local_time'
gem 'page_meta'
gem 'pg', '>= 0.18', '< 2.0'
gem 'postmark-rails'
gem 'puma', '~> 4.2'
gem 'pundit'
gem 'rails', '~> 6.0'
gem 'rails-i18n', '~> 6.0.0'
gem 'rollbar'
gem 'sass-rails', '~> 6'
gem 'turbolinks', '~> 5'
gem 'webpacker', '~> 4.0'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'capybara'
  gem 'dotenv-rails'
  gem 'factory_bot_rails'
  gem 'rspec-rails', '~> 3.9'
  gem 'rubocop', require: false
  gem 'rubocop-rails'
  gem 'selenium-webdriver'
end

group :development do
  gem 'letter_opener'
  gem 'listen', '>= 3.0.5', '< 3.3'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end
