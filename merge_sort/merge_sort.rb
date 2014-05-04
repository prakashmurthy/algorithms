require 'minitest/autorun'

class TestMergeSort < MiniTest::Unit::TestCase
  def test_array_of_1_element
    assert_equal [123], [123].merge_sort
  end

  def test_array_of_2_elements
    assert_equal [87, 123], [123, 87].merge_sort
  end

  def test_array_of_5_elements
    assert_equal [2,3,4,6,8], [3,8,4,6,2].merge_sort
  end

  def test_large_array_reversed
    assert_equal (1..1000).to_a, (1..1000).to_a.reverse.merge_sort
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

class Array
  def merge_sort
    return self if self.length == 1

    new_array = []
    j = 0
    k = 0

    first, second = self.split_in_half.map { |x| x.merge_sort }
    0.upto self.length do |i|
      if first[j] < second[k]
        new_array[i] = first[j]
        j = j + 1
      else
        new_array[i] = second[k]
        k = k + 1
      end

      if j >= first.length
        new_array = new_array + second[k, self.length]
        break
      end

      if k >= second.length
        new_array = new_array + first[j, self.length]
        break
      end
    end
    new_array
  end

  def split_in_half
    len = self.length
    return self if len.zero? || len == 1

    len = len + 1 if len.odd?
    self.each_slice(len/2).to_a
  end
end
