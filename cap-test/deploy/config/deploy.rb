set :application, "cap-test"
set :repository,  "git@github.com:takkyuuplayer/cap-test.git"

role :localhost, "localhost"

set :scm, :git
set :branch, 'master'

set :use_sudo, false
set :group_writtable, true

set :deploy_via, :copy
set :copy_cache,      '/workspace/cap-deployment/capcache'
set :copy_dir,        '/workspace/cap-deployment/local-tmp'
set :deploy_to,       '/workspace/cap-deployment/cap-test'
set :normalize_asset_timestamps, false

set :shared_children, %w(
  web/cache
)

namespace :deploy do
  task :setup_document_root do
    run <<-CMD
      cp -f #{current_path}/web/cache_test.php /workspace/sandbox/
    CMD
  end
  task :clear_cache do
    run <<-CMD
      rm -rf #{shared_path}/realpath.cached &
      rm -rf #{current_path}/web/cache/*
    CMD
  end
end

after 'deploy:finalize_update', 'deploy:setup_document_root'
after 'deploy:restart', 'deploy:clear_cache'
