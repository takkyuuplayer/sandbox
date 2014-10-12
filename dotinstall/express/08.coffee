express = require 'express'
morgan = require 'morgan'

app = express()

app.set 'views', "#{__dirname}/views"
app.set 'view engine', 'ejs'

app.use morgan('combined')
app.use express.static "#{__dirname}/public"

app.param 'id', (req, res, next, id) ->
  users = ['taguchi', 'fkoji', 'dotinstall']
  req.params.name = users[id]
  next()

app.get '/hello/:id', (req, res) ->
  res.send 'hello ' + req.params.name

app.listen 3000
console.log 'server starting...'

