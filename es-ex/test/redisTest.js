var assert = require("power-assert");

describe('redis', function() {
  var client = require('redis').createClient();

  client.set('key1', 'val1');
  it('has getter', function() {
    assert('val1', client.get('key1'));
  });
});
