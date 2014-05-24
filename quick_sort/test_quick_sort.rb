require 'minitest/autorun'
require './quick_sort'

class QuickSortTest < MiniTest::Unit::TestCase
  def test_sort_sample_1
    ary = [9,0,2,4,1,5,7,3,8,6]
    expected = (0..9).to_a

    assert_equal expected, QuickSort.new(ary).partition
  end

  def test_sort_sample_with_duplicates
    ary = [2, 5, 6, 556, 6, 6, 8, 9, 0, 123, 556]
    expected = [0, 2, 5, 6, 6, 6, 8, 9, 123, 556, 556]

    assert_equal expected, QuickSort.new(ary).partition
  end

  def test_sort_one_element_array
    ary = [2]
    assert_equal ary, QuickSort.new(ary).partition
  end

  def test_sort_null_array
    ary = []
    assert_equal ary, QuickSort.new(ary).partition
  end

  def test_array_with_even_number_of_elements
    ary = [123, 87, 42, 1004]
    expected = [42, 87, 123, 1004]

    assert_equal expected, QuickSort.new(ary).partition
  end

  def test_array_with_odd_number_of_elements
    ary = [123, 87, -4, 42, 1004]
    expected = [-4, 42, 87, 123, 1004]

    assert_equal expected, QuickSort.new(ary).partition
  end

  def test_reasonably_large_array
    expected = (1..100000).to_a
    ary = expected.shuffle

    refute_equal expected, ary
    assert_equal expected, QuickSort.new(ary).partition
  end
end
