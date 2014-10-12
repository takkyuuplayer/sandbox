express = require 'express'
app = express()

app.get '/hello.txt', (req, res) ->
  res.send 'hello from app.js'

app.route '/hello.txt'
  .get (req, res) ->
    res.send 'hello from app.js'

app.use express.static "#{__dirname}/public"

app.listen 3000
console.log 'server starting...'

