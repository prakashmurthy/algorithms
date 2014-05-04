class EnhancedArray
  attr_accessor :sorted_array, :inversions_count
  def initialize(input_array)
    @inversions_count = 0
    @sorted_array = merge_sort(input_array)
  end

  def merge_sort(input_array)
    return input_array if input_array.length <= 1

    new_array = []
    j = 0
    k = 0

    first, second = input_array.split_in_half.map { |x| merge_sort(x) }
    0.upto input_array.length do |i|
      if first[j] < second[k]
        new_array[i] = first[j]
        j = j + 1
      else
        new_array[i] = second[k]
        k = k + 1
        @inversions_count += first.length - j
      end

      if j >= first.length
        new_array = new_array + second[k, input_array.length]
        break
      end

      if k >= second.length
        new_array = new_array + first[j, input_array.length]
        break
      end
    end
    new_array
  end
end

class Array
  def split_in_half
    len = self.length
    return self if len.zero? || len == 1

    len = len + 1 if len.odd?
    self.each_slice(len/2).to_a
  end
end
