express = require 'express'
morgan = require 'morgan'
bodyParser = require 'body-parser'

app = express()

app.set 'views', "#{__dirname}/views"
app.set 'view engine', 'ejs'

app.use bodyParser.urlencoded()
app.use bodyParser.json()

app.use morgan('combined')
app.use express.static "#{__dirname}/public"

app.get '/new', (req, res) ->
  res.render 'new'
app.post '/create', (req, res) ->
  res.send req.body.name


app.get '/hello/:id', (req, res) ->
  res.send 'hello ' + req.params.name

app.listen 3000
console.log 'server starting...'

