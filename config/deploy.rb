# config valid for current version and patch releases of Capistrano
lock "~> 3.11.0"

set :stage, 'production'
set :application, "tlocards"
set :repo_url, "git@github.com:davidgoli/tlocards.git"
set :domain, 'web213.webfaction.com'
set :local_user, 'david'
ask :password, 'password', echo: false

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, "/home/david/webapps/tlocards/tlocards"

role :web, fetch(:domain)                          # Your HTTP server, Apache/etc
role :app, fetch(:domain)                          # This may be the same as your `Web` server
role :db,  fetch(:domain), :primary => true # This is where Rails migrations will run


# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# append :linked_files, "config/database.yml"

# Default value for linked_dirs is []
# append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }
server fetch(:domain), user: fetch(:local_user), port: 22, password: fetch(:password), roles: %w{web app db}

# Default value for keep_releases is 5
# set :keep_releases, 5

# Uncomment the following to require manually verifying the host key before first deploy.
# set :ssh_options, verify_host_key: :secure
