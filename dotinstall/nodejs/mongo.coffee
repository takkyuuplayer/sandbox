MongoClient = require('mongodb').MongoClient
settings = require './setting'

MongoClient.connect "mongodb://#{settings.host}/#{settings.db}", (err, db) ->
  if err
    return console.dir err
  console.log 'connectedto db'

  db.collection 'users', (err, collection) ->
    if err
      return console.dir err
    docs = [
      name: 'taguchi'
      score: 40
    ,
      name: 'fkoji'
      score: 80
    ,
      name: 'dotinstall'
      score: 60
    ]
    #collection.find(name: 'taguchi').toArray (err, items) ->
    #  console.log items

    stream = collection.find().stream()
    stream.on 'data', (item) ->
      console.log item
    stream.on 'end', ->
      console.log 'finished'
