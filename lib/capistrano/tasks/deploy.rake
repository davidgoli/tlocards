#task :default do
#  on roles(:app) do
#    deploy.web.disable
#    set :migrate_target, :latest
#    deploy.update_code
#    deploy.symlink
#    deploy.restart
#    deploy.web.enable
#  end
#end
task :restart do
  on roles(:app) do
    run "touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end
