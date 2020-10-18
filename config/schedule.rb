# frozen_string_literal: true

project_dir = File.expand_path(File.dirname(__FILE__) + '/..')
set :output, "#{path}/log/crontab.log"

every :hour do
  command "cd #{project_dir} && RAILS_ENV=#{ENV['RAILS_ENV']} bundle exec rake oceano:cache:properties"
  command "cd #{project_dir} && RAILS_ENV=#{ENV['RAILS_ENV']} bundle exec rake oceano:cache:weather"
end
