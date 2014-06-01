require 'minitest/autorun'
require './graph'

class GraphTest < MiniTest::Unit::TestCase
  def setup

    ### Case # 1 : Simple tree (3 nodes, 2 edges) ######
    # A -- B
    #       \
    #        \
    #         C
    ################### 
    @three_nodes_two_edges = Graph.new(<<END
A B
B A C
C B
END
    )

    #### Case # 2 : Two cliques separated by minimum cut ###
    # 3--4-----5--6
    # |\/|     |\/|
    # |/\|     |/\|
    # 2--1-----7--8
    #######
    @two_cliques_sep_by_min_cut = Graph.new(<<END
1 2 3 4 7
2 1 3 4
3 1 2 4
4 1 2 3 5
5 4 6 7 8
6 5 7 8
7 1 5 6 8
8 5 6 7
END
    )

    #### Case # 3 : Square with no diagonals ######
    # A--B
    # |  |
    # |  |
    # C--D
    #######
    @square = Graph.new(<<END
A B C
B A D
C A D
D B C
END
                       )

    #### Case # 4 : Square with one diagonals ######
    # A--B
    # |\ |
    # | \|
    # C--D
    #######
    @square_one = Graph.new(<<END
A B C D
B A D
C A D
D A B C
END
                           )

    #### Case # 5 : Square with two diagonals ######
    # A--B
    # |\/|
    # |/\|
    # C--D
    #######
    @square_two = Graph.new(<<END
A B C D
B A C D
C A B D
D A B C
END
    )
  end

  def test_number_of_vertices
    assert_equal 3, @three_nodes_two_edges.number_of_vertices
    assert_equal 8, @two_cliques_sep_by_min_cut.number_of_vertices
    assert_equal 4, @square.number_of_vertices
    assert_equal 4, @square_one.number_of_vertices
    assert_equal 4, @square_two.number_of_vertices
  end

  def test_vertices
    assert_equal %w(A B C), @three_nodes_two_edges.vertices
    assert_equal %w(1 2 3 4 5 6 7 8), @two_cliques_sep_by_min_cut.vertices
    assert_equal %w(A B C D), @square.vertices
    assert_equal %w(A B C D), @square_one.vertices
    assert_equal %w(A B C D), @square_two.vertices
  end

  def test_edges
    assert_equal [["A <=> B", 1], ["B <=> C", 1]] , @three_nodes_two_edges.edges
    assert_equal [["1 <=> 2", 1], ["1 <=> 3", 1], ["1 <=> 4", 1], ["1 <=> 7", 1],
                  ["2 <=> 3", 1], ["2 <=> 4", 1],
                  ["3 <=> 4", 1],
                  ["4 <=> 5", 1],
                  ["5 <=> 6", 1], ["5 <=> 7", 1], ["5 <=> 8", 1],
                  ["6 <=> 7", 1], ["6 <=> 8", 1],
                  ["7 <=> 8", 1]
                  ], @two_cliques_sep_by_min_cut.edges
    assert_equal [["A <=> B", 1], ["A <=> C", 1],
                  ["B <=> D", 1], ["C <=> D", 1]] , @square.edges
    assert_equal [["A <=> B", 1], ["A <=> C", 1],
                  ["A <=> D", 1],
                  ["B <=> D", 1], ["C <=> D", 1]] , @square_one.edges
    assert_equal [["A <=> B", 1], ["A <=> C", 1],
                  ["A <=> D", 1], ["B <=> C", 1],
                  ["B <=> D", 1], ["C <=> D", 1]] , @square_two.edges
  end

  def test_collapse
    assert_equal [["B <=> C", 1]], @three_nodes_two_edges.collapse(["A <=> B", 1])
    assert_equal [["A <=> C", 1], ["B <=> D", 1], ["C <=> D", 1]], @square.collapse(["A <=> B", 1])
  end
end
