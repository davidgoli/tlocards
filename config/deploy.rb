require 'bundler/capistrano'
set :application, "tlocards"
set :repository,  "git@github.com:davidgoli/tlocards.git"

set :scm, :git
set :deploy_via, :remote_cache
set :use_sudo, false
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, "redeem.translinguisticother.com"                          # Your HTTP server, Apache/etc
role :app, "redeem.translinguisticother.com"                          # This may be the same as your `Web` server
role :db,  "redeem.translinguisticother.com", :primary => true # This is where Rails migrations will run

namespace :deploy do
  task :default do
    deploy.web.disable
    set :migrate_target, :latest
    deploy.update_code
    deploy.symlink
    deploy.restart
    deploy.web.enable
  end
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end
