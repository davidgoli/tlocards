require 'bundler/capistrano'
set :application, "tlocards"
set :repository,  "git@github.com:davidgoli/tlocards.git"
set :user, "david"
set :password, "pUkU8ad4"
set :domain, "web213.webfaction.com"
set :appdir, "webapps/tlocards/tlocards"

set :scm, :git
set :deploy_via, :remote_cache
set :use_sudo, false
set :branch, "master"
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, domain                          # Your HTTP server, Apache/etc
role :app, domain                          # This may be the same as your `Web` server
role :db,  domain, :primary => true # This is where Rails migrations will run

set :deploy_to, appdir
set :deploy_via, :export

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
