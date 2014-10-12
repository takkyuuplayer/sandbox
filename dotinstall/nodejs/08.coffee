http = require 'http'
fs = require 'fs'
setting = require './setting.coffee'
console.log setting

server = http.createServer()
server.on 'request', (req, res) ->
  fs.readFile "#{__dirname }/public_html/hellooo.", 'utf-8', (error, data) ->
    if error
      res.writeHead 404, 'Content-Type': 'text/plain'
      res.write 'not found'
      return res.end()

    res.writeHead 200, 'Content-Type': 'text/html'
    res.write data
    res.end()
server.listen setting.port, setting.host
console.log 'server listenning...'
