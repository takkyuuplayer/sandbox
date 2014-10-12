http = require 'http'
setting = require './setting.coffee'
console.log setting

server = http.createServer()
server.on 'request', (req, res) ->
  console.req
  switch req.url
    when '/about'
      msg = 'about this page'
    when '/profile'
      msg = 'about me'
    else
      msg = 'wrong page'

  res.writeHead 200, \
    'Content-Type': 'text/plain'
  res.write msg
  res.end()
server.listen setting.port, setting.host
console.log 'server listenning...'
