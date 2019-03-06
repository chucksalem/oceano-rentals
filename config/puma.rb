# frozen_string_literal: true

port        ENV.fetch('PORT') { 3000 }
environment ENV.fetch('RAILS_ENV') { 'development' }

workers 2
preload_app!

bind "unix://tmp/puma.sock"

daemonize true

pidfile 'tmp/pids/puma.pid'
