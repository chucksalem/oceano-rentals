# frozen_string_literal: true

lock '~> 3.11.0'

set :application, 'oceano_rentals'
set :repo_url, 'git@github.com:chucksalem/oceano-rentals.git'
set :migration_role, :app
set :pty, true
set :branch, ENV['BRANCH'] || 'master'
set :assets_roles, %i[web app]
set :puma_workers, 2
set :puma_preload_app, true
set :deploy_to, '/home/apps/oceano_rentals'
set :puma_restart_command,
    'bundle exec pumactl -S /home/apps/oceano_rentals/shared/tmp/pids/puma.state -F /home/apps/oceano_rentals/shared/config/puma.rb restart'

append :linked_files, 'config/database.yml', 'config/master.key'
append :linked_dirs, '.bundle', 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'public/system', 'public/uploads'

set :whenever_identifier, -> { "#{fetch(:application)}_#{fetch(:stage)}" }
set :whenever_roles,      -> { :app }
