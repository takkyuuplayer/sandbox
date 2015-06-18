role :vagrant , "localhost"

server 'localhost',
  user: 'vagrant',
  ssh_options: {
    auth_methods: %w(publickey)
  }
