# frozen_string_literal: true

server '104.237.159.94', user: 'deploy', roles: %w[app db web]
set :rails_env, 'staging'
set :puma_conf, "#{shared_path}/config/puma.rb"
