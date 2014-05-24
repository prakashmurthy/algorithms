require './last_element_pivot'

input_array = []
File.open('QuickSort.txt', 'r') do |f1|
  while line = f1.gets
    input_array << line.to_i
  end
end
qs = QuickSort.new(input_array)
result = qs.partition
puts
puts result[-100..-1].join(',')
puts
puts result[0..99].join(',')
puts "\n###\nComparison count: #{qs.comparison_count}\n###\n"
