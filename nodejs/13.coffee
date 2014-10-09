http = require 'http'
fs = require 'fs'
setting = require './setting.coffee'
ejs = require 'ejs'
qs = require 'querystring'

template = fs.readFileSync "#{__dirname}/public_html/bbs.ejs", 'utf-8'
posts= []

server = http.createServer()
server.on 'request', (req, res) ->
  renderForm = (posts, res) ->
    data = ejs.render template, posts:posts
    res.writeHead 200, 'Content-Type': 'text/html'
    res.write data
    res.end()
  if req.method is 'POST'
    req.data = ''
    req.on 'readable', ->
      req.data += req.read()
    req.on 'end', ->
      query = qs.parse req.data
      posts.push query.name
      renderForm posts, res
  else
    renderForm posts, res

server.listen setting.port, setting.host
console.log 'server listenning...'
