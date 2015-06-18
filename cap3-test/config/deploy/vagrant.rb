role :vagrant , "localhost"

server 'localhost',
  user: 'vagrant',
  ssh_options: {
    auth_methods: %w(publickey)
  }

before :"rsync:sync", :import_local_git do
  run_locally do
    execute :git, :clone, 'git@github.com-tp:takkyuuplayer/dotfiles.git', "#{fetch(:rsync_src)}/local-git"
  end
end
