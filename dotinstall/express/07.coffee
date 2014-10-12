express = require 'express'
morgan = require 'morgan'

app = express()

app.use express.static "#{__dirname}/public"
app.use morgan('combined')
app.use (req,res, next) ->
  console.log 'my middle ware'
  next()

app.get '/hello.txt', (req, res) ->
  res.send 'hello from app.js'

app.route '/hello.txt'
  .get (req, res) ->
    res.send 'hello from app.js'

app.listen 3000
console.log 'server starting...'

