set :application, "cap-test"
set :repository,  "git@github.com:takkyuuplayer/sandbox.git"

role :localhost, "localhost"

set :scm, :git
set :branch, 'dev-capistrano_with_local'

set :use_sudo, false
set :group_writtable, true

set :deploy_via, :copy
set :copy_cache,      '/srv/work/cap-deployment/capcache'
set :copy_dir,        '/srv/work/cap-deployment/local-tmp'
set :deploy_to,       '/srv/work/cap-deployment/cap-test'
set :normalize_asset_timestamps, false
