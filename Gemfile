# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.1'

gem 'figaro'
gem 'forecast_io'
gem 'foreman'
gem 'haml'
gem 'mailgun-ruby'
gem 'multi_json'
gem 'puma', '~> 3.11'
gem 'rack-attack'
gem 'rails', '~> 5.2.2'
gem 'rake', '~> 11.0'
gem 'ransack'
gem 'redis'
gem 'responders'
gem 'roo', '~> 2.8.0'
gem 'sass-rails', '~> 5.0'
gem 'savon'
gem 'sqlite3', '~> 1.3.6'
gem 'uglifier'
gem 'virtus'
gem 'whenever'
gem 'will_paginate', '= 3.1.0'

gem 'coffee-rails', '~> 4.2'
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails'
gem 'turbolinks', '~> 5'

gem 'bootsnap', '>= 1.1.0', require: false

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'dotenv-rails'
  gem 'overcommit'
  gem 'pry-rails'
  gem 'rubocop'
end

group :development do
  gem 'capistrano', '~> 3.11', require: false
  gem 'capistrano-bundler', '~> 1.5'
  gem 'capistrano-rails', '~> 1.4', require: false
  gem 'capistrano-rvm'
  gem 'capistrano3-puma'
  gem 'letter_opener'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'chromedriver-helper'
  gem 'cucumber-rails', require: false
  gem 'database_cleaner'
  gem 'factory_bot'
  gem 'faker'
  gem 'rspec'
  gem 'rspec-rails'
  gem 'rspec-virtus'
  gem 'selenium-webdriver'
  gem 'simplecov'
  gem 'webmock'
  gem 'vcr'
end

group :doc do
  gem 'sdoc'
end

gem 'rails-assets-DataTables', source: 'https://rails-assets.org'

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
