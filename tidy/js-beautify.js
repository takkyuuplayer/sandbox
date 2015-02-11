var assert = require('power-assert');
describe('Array', function() {
  describe('PushAndPop()', function() {
    it('should return index when the value is present', function() {
      var stack = [];
      assert.equal(stack.length, 0);
      stack.push('foo');
      assert.equal(stack[stack.length - 1], 'foo');
      assert.equal(stack.pop(), 'foo');
      assert.equal(stack.length, 0);
    });
  });
});