role :vagrant , "localhost"

server 'localhost',
  user: 'vagrant',
  ssh_options: {
    auth_methods: %w(publickey)
  }

before :"rsync:sync", :import_local_git do
  run_locally do
    execute :git, :clone, 'git@github.com-tp:takkyuuplayer/dotfiles.git', "#{fetch(:rsync_src)}/local-git" \
      if not File.directory? "#{fetch(:rsync_src)}/local-git"
    execute "cd #{fetch(:rsync_src)} && git fetch --quiet --all --prune"
    execute "cd #{fetch(:rsync_src)} && git reset --hard origin/master"
  end
end

before :import_local_git, :carton_install do
  run_locally do
    execute "cd #{fetch(:rsync_src)}/perl-ex && carton install --deployment"
  end
end
