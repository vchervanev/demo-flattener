require 'minitest/autorun'
require 'array_queue_adapter'

class TestArrayQueueAdapter < Minitest::Test
  def test_basic_flow
    adapter = ArrayQueueAdapter.new(Array.new(3) { |i| i })

    assert adapter.any?
    assert_equal 0, adapter.shift
    assert adapter.any?
    assert_equal 1, adapter.shift
    assert adapter.any?
    assert_equal 2, adapter.shift
    assert !adapter.any?
  end
end
