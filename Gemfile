# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.1'

gem 'figaro'
gem 'forecast_io'
gem 'foreman'
gem 'mailgun-ruby'
gem 'multi_json'
gem 'puma', '~> 3.11'
gem 'rack-attack'
gem 'rails', '~> 5.2.2'
gem 'rake', '~> 11.0'
gem 'redis'
gem 'responders'
gem 'sass-rails', '~> 5.0'
gem 'savon'
gem 'sqlite3', '~> 1.3.6'
gem 'uglifier'
gem 'virtus'
gem 'whenever'
gem 'will_paginate'

gem 'coffee-rails', '~> 4.2'
gem 'jbuilder', '~> 2.5'
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
  gem 'capistrano'
  gem 'capistrano-bundler'
  gem 'capistrano-rails'
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
end

group :doc do
  gem 'sdoc'
end

gem 'rails-assets-DataTables', source: 'https://rails-assets.org'

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
