require 'minitest/autorun'
require 'stack'

class TestStack < Minitest::Test
  def test_initial_state
    assert_empty Stack.new
    assert !Stack.new.any?
  end

  def test_single_push_pop
    s = Stack.new
    s.push :first

    assert s.any?
    assert !s.empty?
    assert_equal :first, s.pop
    assert !s.any?
    assert s.empty?
  end

  def test_empty_pop
    assert_raises(StandardError) { Stack.new.pop }
  end

  def test_stack_order
    s = Stack.new
    s.push :first
    s.push :second
    s.push :third

    assert_equal :third, s.pop
    assert_equal :second, s.pop
    assert_equal :first, s.pop
  end
end
