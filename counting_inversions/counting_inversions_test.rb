require 'minitest/autorun'
require './counting_inversions.rb'

class TestCountingInversions < MiniTest::Unit::TestCase
  def test_with_0_elements
    a = EnhancedArray.new([])
    assert_equal [], a.sorted_array
    assert_equal 0, a.inversions_count
  end

  def test_with_1_element
    a = EnhancedArray.new([35])
    assert_equal [35], a.sorted_array
    assert_equal 0, a.inversions_count
  end

  def test_with_2_elements_0
    a = EnhancedArray.new([53,127])
    assert_equal [53,127], a.sorted_array
    assert_equal 0, a.inversions_count
  end

  def test_with_2_elements_1
    a = EnhancedArray.new([127,53])
    assert_equal [53,127], a.sorted_array
    assert_equal 1, a.inversions_count
  end

  def test_with_3_elements_0
    a = EnhancedArray.new([53,120,127])
    assert_equal [53,120,127], a.sorted_array
    assert_equal 0, a.inversions_count
  end

  def test_with_3_elements_1
    a = EnhancedArray.new([53,127,120])
    assert_equal [53,120,127], a.sorted_array
    assert_equal 1, a.inversions_count
  end

  def test_with_3_elements_2
    a = EnhancedArray.new([127,53,120])
    assert_equal [53,120,127], a.sorted_array
    assert_equal 2, a.inversions_count
  end

  def test_with_3_elements_3
    a = EnhancedArray.new([127,120,53])
    assert_equal [53,120,127], a.sorted_array
    assert_equal 3, a.inversions_count
  end

  def test_with_4_elements_0
    a = EnhancedArray.new([1,2,3,5])
    assert_equal [1,2,3,5], a.sorted_array
    assert_equal 0, a.inversions_count
  end

  def test_with_4_elements_1
    a = EnhancedArray.new([1,3,2,5])
    assert_equal [1,2,3,5], a.sorted_array
    assert_equal 1, a.inversions_count
  end

  def test_with_4_elements_2
    a = EnhancedArray.new([1,5,2,3])
    assert_equal [1,2,3,5], a.sorted_array
    assert_equal 2, a.inversions_count
  end

  def test_with_4_elements_3
    a = EnhancedArray.new([3,2,1,5])
    assert_equal [1,2,3,5], a.sorted_array
    assert_equal 3, a.inversions_count
  end

  def test_with_4_elements_4
    a = EnhancedArray.new([2,5,3,1])
    assert_equal [1,2,3,5], a.sorted_array
    assert_equal 4, a.inversions_count
  end

  def test_with_4_elements_5
    a = EnhancedArray.new([5,2,3,1])
    assert_equal [1,2,3,5], a.sorted_array
    assert_equal 5, a.inversions_count
  end

  def test_with_4_elements_6
    a = EnhancedArray.new([5,3,2,1])
    assert_equal [1,2,3,5], a.sorted_array
    assert_equal 6, a.inversions_count
  end

  def test_split_array_with_even_length
    assert_equal [[2,3,4], [5,6,7]], [2,3,4,5,6,7].split_in_half
  end

  def test_split_array_with_odd_length
    assert_equal [[1,2], [3]], [1,2,3].split_in_half
  end

  def test_split_array_with_one_element
    assert_equal [1], [1].split_in_half
  end

  def test_split_empty_array
    assert_equal [], [].split_in_half
  end
end

