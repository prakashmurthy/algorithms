require './counting_inversions.rb'

# a = EnhancedArray.new([34,4,5])
# puts a.sorted_array.join(' ')
# puts a.inversions_count

input_array = []
File.open('IntegerArray.txt', 'r') do |f1|
  while line = f1.gets
    input_array << line.to_i
  end
end
puts input_array.length

a = EnhancedArray.new(input_array)
puts a.inversions_count
