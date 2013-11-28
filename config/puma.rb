pidfile "tmp/pids/puma.pid"
state_path "tmp/pids/puma.state"
bind "unix:///tmp/stacktxt.sock"
daemonize true
workers 1
threads 8,32
preload_app!