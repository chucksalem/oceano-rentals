threads 0,8
workers 2
preload_app!

#bind "unix://tmp/puma.sock"
bind "tcp://0.0.0.0:3000"

daemonize false

pidfile 'tmp/pids/puma.pid'

