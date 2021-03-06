class Vertex
  attr_accessor :value, :in_edges, :out_edges
  def initialize(value)
    @value = value
    @in_edges = Array.new
    @out_edges = Array.new
  end

  def to_s
    value
  end
end

class Edge
  attr_accessor :from_vertex, :to_vertex, :cost
  def initialize(from_vertex, to_vertex, cost = 1)
    @from_vertex = from_vertex
    @to_vertex = to_vertex
    @from_vertex.out_edges << self
    @to_vertex.in_edges << self
    @cost = cost
  end

  def destroy!
    @from_vertex.out_edges.delete(self)
    @to_vertex.in_edges.delete(self)
    @from_vertex = nil
    @to_vertex = nil
  end

  def to_s
    "#{from_vertex.to_s} -> #{to_vertex.to_s}"
  end
end
