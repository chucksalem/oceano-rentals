require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module OceanoRentals
  class Application < Rails::Application
    config.autoload_paths << "#{Rails.root}/lib"
    config.middleware.use Rack::Attack
    config.load_defaults 5.2
  end
end
