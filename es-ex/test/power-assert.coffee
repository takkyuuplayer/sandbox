assert = require 'power-assert'

class Person
  constructor: (name, age) ->
    @name = name
    @age = age

describe "various types", ->
  beforeEach ->
    @types = [
      "string"
      98.6
      true
      false
      null
      `undefined`
      ["nested", "array"]
      { object: true }
      NaN
      Infinity
      /^regex/
      new Person("alice", 3)
    ]

  it "demo", ->
    index = @types.length - 1
    bob = new Person("bob", 5)
    assert @types[index].name isnt bob.name