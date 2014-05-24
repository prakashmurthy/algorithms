class QuickSort
  attr_accessor :comparison_count
  def initialize(input_array)
    @comparison_count = 0
    @input_array = input_array
  end

  def partition(input_array = @input_array)
    # End cases : When the array has either one or no elements
    array_length = input_array.length
    return input_array if array_length <= 1
    @comparison_count += array_length - 1

    # Pick the pivot
    pivot_index = array_length - 1
    pivot = input_array[pivot_index]

    # Swap pivot with first item if not the first item
    input_array[0], input_array[pivot_index] = input_array[pivot_index], input_array[0]
    
    i = 1 # pointer for separation between less than & greater than pivot
    j = 1 # pointer for separation between examined & unexamined parts

    # One pass through the entire array
    input_array.each_with_index do |value, k|
      next if k == 0
      j = j + 1 # Increment this pointer for every element

      if value < pivot # If a number smaller than pivot is found
        # swap the number with the first number in the 'more' section
        input_array[k], input_array[i] = input_array[i], input_array[k]
        i = i + 1 # Increment this pointer only when a smaller element is found
      end
    end

    # Swap the pivot element with the largest of the numbers less than the pivot
    input_array[0], input_array[i-1] = input_array[i-1], input_array[0]

    # 'less' holds all elements smaller than the pivot
    less = []
    less = input_array[0..i-2] if i > 1

    # 'more' holds all the elements greater than the pivot
    more = input_array[i..-1]
    
    # Recursively partition the two sub-arrays
    final_array = partition(less) + [pivot] + partition(more)
  end
end

if __FILE__ == $0
  length = rand(20..500)
  puts "\n###\nLength of array is #{length}\n###\n"
  sample_array = (1..length).to_a.shuffle
  puts QuickSort.new(sample_array).partition.join(',')
end
