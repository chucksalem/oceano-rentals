#!/bin/bash

echo '##  starting entrypoint'
echo '-----------------------'

echo 'making sure server .pid is gone'
rm /app/tmp/pids/server.pid
echo 'run startup script'

set -ex


service redis-server start &

bundle install
bundle exec foreman start

