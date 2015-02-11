require 'test/unit'

class StackTest < Test::Unit::TestCase
def test_PushAndPop
stack = []; assert_same stack.length, 0
stack.push 'foo'
assert_equal stack.last, 'foo'
assert_equal stack.length, 1
assert_equal stack.pop, 'foo'
assert_equal stack.length, 0
end
end
