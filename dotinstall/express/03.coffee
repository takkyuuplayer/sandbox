express = require 'express'
app = express()

app.get '/', (req, res) ->
  res.send 'hello world'

app.get '/about', (req, res) ->
  res.send 'about this page'

app.listen 3000
console.log 'server starting...'

