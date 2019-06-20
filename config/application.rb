# frozen_string_literal: true

require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module OceanoRentals
  class Application < Rails::Application
    config.eager_load_paths << Rails.root.join('lib')
    config.middleware.use Rack::Attack
    config.load_defaults 5.2
  end
end
