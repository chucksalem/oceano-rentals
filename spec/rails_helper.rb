ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../config/environment', __dir__)

abort('The Rails environment is running in production mode!') if Rails.env.production?
require 'spec_helper'
require 'rspec/rails'
require 'pry'
require 'faker'

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!

  config.include FactoryBot::Syntax::Methods
  config.include EscapiaHelpers
  config.include Requests::JsonHelpers, type: :request
  config.include AuthHelper
end

VCR.configure do |c|
  c.cassette_library_dir = 'spec/vcr'
  c.stub_with :webmock
  c.allow_http_connections_when_no_cassette = true
  c.configure_rspec_metadata!
end

RedisClient = Redis.new(
    host: ENV['REDIS_HOST'] || 'localhost',
    port: ENV['REDIS_PORT'] || 6379,
    db: 15
)
