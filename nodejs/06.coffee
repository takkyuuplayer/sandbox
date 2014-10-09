http = require 'http'
setting = require './setting.coffee'
console.log setting

server = http.createServer()
server.on 'request', (req, res) ->
  res.writeHead 200, \
    'Content-Type': 'text/plain'
  res.write('hello world')
  res.end()
server.listen setting.port, setting.host
console.log 'server listenning...'
