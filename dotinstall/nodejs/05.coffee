http = require 'http'
server = http.createServer()
server.on 'request', (req, res) ->
  res.writeHead 200, \
    'Content-Type': 'text/plain'
  res.write('hello world')
  res.end()
server.listen 1337,'192.168.100.101'
console.log 'server listenning...'
