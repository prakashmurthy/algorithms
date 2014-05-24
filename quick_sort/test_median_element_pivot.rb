require 'minitest/autorun'
require './median_element_pivot'

class QuickSortTest < MiniTest::Unit::TestCase
  def test_given_sample
    ary = [8, 2, 4, 5, 7, 1]
    qs = QuickSort.new(ary)
    assert_equal 2, qs.pick_pivot_index(ary)
  end

  def test_given_sample_2
    ary = [4, 2, 8, 5, 7, 1]
    qs = QuickSort.new(ary)
    assert_equal 0, qs.pick_pivot_index(ary)
  end

  def test_given_sample_3
    ary = [8, 2, 1, 5, 7, 4]
    qs = QuickSort.new(ary)
    assert_equal 5, qs.pick_pivot_index(ary)
  end

  def test_second
    ary = [1,2,3]
    qs = QuickSort.new(ary)
    assert_equal 1, qs.pick_pivot_index(ary)
  end

  def test_last
    ary = [1,3,2]
    qs = QuickSort.new(ary)
    assert_equal 2, qs.pick_pivot_index(ary)
  end

  def test_first
    ary = [2,3,1]
    qs = QuickSort.new(ary)
    assert_equal 0, qs.pick_pivot_index(ary)
  end

  def test_first_even
    ary = [3, 2, 1, 4]
    qs = QuickSort.new(ary)
    assert_equal 0, qs.pick_pivot_index(ary)
  end

  def test_middle_even
    ary = [2, 3, 1, 4]
    qs = QuickSort.new(ary)
    assert_equal 1, qs.pick_pivot_index(ary)
  end

  def test_last_even
    ary = [4, 2, 1, 3]
    qs = QuickSort.new(ary)
    assert_equal 3, qs.pick_pivot_index(ary)
  end
end
