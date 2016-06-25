require 'minitest/autorun'
require 'flattener'

class TestFlattener < Minitest::Test
  def test_from_assignment
    assert_equal [1, 2, 3, 4], Flattener.perform([[1, 2, [3]], 4])
  end

  def test_empty
    assert_equal [], Flattener.perform([])
  end

  def test_flat
    assert_equal [1, 2, 3, 4], Flattener.perform([1, 2, 3, 4])
  end

  def test_nested_empty
    assert_equal [], Flattener.perform([[], []])
  end

  def test_nested_end
    assert_equal [10, 20, 30], Flattener.perform([10, [20, 30]])
  end

  def test_nested_start
    assert_equal [10, 20, 30], Flattener.perform([[10, 20], 30])
  end

  def test_deep_nested_flat
    assert_equal [10, 20, 30], Flattener.perform([[[[[[10, 20, 30]]]]]])
  end

  def test_deep_nested
    assert_equal [10, 20, 30],
                 Flattener.perform([[[[[[10, [20, [30]]]]]]]])
  end

  def test_deep_nested_and_empty
    assert_equal [10, 20, 30],
                 Flattener.perform([[[[[[10, [20, [], [30]]]]], []]]])
  end

  def test_complex
    assert_equal [5, 10, 20, 30, 35],
                 Flattener.perform([[[5], [[[[10, [20, [], [30]]]]], []]], 35])
  end

  def test_invalid_input
    assert_raises(StandardError) { Flattener.perform(35) }
  end

  def test_respect_non_integer
    assert_equal [nil, 's', :symbol],
                 Flattener.perform([[], [nil, ['s', :symbol]]])
  end
end
