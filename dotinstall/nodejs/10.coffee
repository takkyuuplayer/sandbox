http = require 'http'
fs = require 'fs'
setting = require './setting.coffee'
ejs = require 'ejs'
console.log setting

template = fs.readFileSync "#{__dirname}/public_html/hello.ejs", 'utf-8'
n = 0

server = http.createServer()
server.on 'request', (req, res) ->
  data = ejs.render template,
    title:'Hello'
    content: '<strong>World</strong>'
    n: ++n
  res.writeHead 200, 'Content-Type': 'text/html'
  res.write data
  res.end()
server.listen setting.port, setting.host
console.log 'server listenning...'
