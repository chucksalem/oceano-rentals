# frozen_string_literal: true

server '192.155.86.203', user: 'deploy', roles: %w[app db web]
set :rails_env, 'production'
