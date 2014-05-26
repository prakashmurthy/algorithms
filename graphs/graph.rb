class Graph
  attr_accessor :hash, :input_string, :edges
  def initialize(input_string)
    @input_string = input_string
    @hash = {}
    @edges = []

    process_input
  end

  def print_graph
    @hash.each do |k, v|
      puts "Vertex : #{k} joined to #{v.join(',')} vertices."
    end
  end

  def process_input
    @input_string.split(/\r?\n/).each do |line|
      array = line.split(" ")
      vertex = array.shift
      @hash[vertex] = array
      array.each do |item|
        edge = "#{vertex} <=> #{item}"
        reverse_edge = "#{item} <=> #{vertex}"
        @edges << [edge, 1] unless @edges.include?([reverse_edge, 1])
      end
    end
  end

  def number_of_vertices
    @hash.keys.count
  end

  def vertices
    @hash.keys
  end

  def edges
    @edges
  end

  def collapse(edge)
    @edges.delete(edge)
    @edges
  end
end

if __FILE__ == $0
  input = <<END
1 2 3 4 7
2 1 3 4
3 1 2 4
4 1 2 3 5
5 4 6 7 8
6 5 7 8
7 1 5 6 8
8 5 6 7
END

  g = Graph.new(input)
  g.process_input
  g.print_graph
end
