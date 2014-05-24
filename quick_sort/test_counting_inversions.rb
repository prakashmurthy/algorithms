require 'minitest/autorun'
require './quick_sort'

class QuickSortTest < MiniTest::Unit::TestCase
  def test_sort_sample_1
    ary = [1,2,3,4]
    
    qs = QuickSort.new(ary)

    actual = qs.partition
    assert_equal 0, qs.inversions_count, "Sorted array inversion count must be 0"
  end
end
