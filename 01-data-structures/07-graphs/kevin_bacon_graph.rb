require_relative "node"
require "pry"
class KevinBaconGraph

  attr_reader :actors # vertices
  attr_reader :films # edges

  def initialize(actors:, films:)
    @actors = actors
    @films = films

  end

  def populate_edges
    @actors.each do |actor|
      @films.each do |film|
        if film.actors.include?(actor)
          actor.add_film(film)
        end
      end
    end
  end

  # Write a function that begins at a provided Node object and returns an Array
  # of at most six film titles that connect it to the Kevin_Bacon Node
  # find shortest path from start to node where node.name = "Kevin Bacon"
  # using a BFS :
  # variables to keep track of :
  # visited = []
  # path tree: a hash that contains keys for each vertex with an array of
  # Each vertex has set of edges represented by the film name.
  # The film name has set of values pointing to each vertex that can be accessed
  # with the film
  # So to map the edges iterate through values for each film
  # in
  # construct a tree
  def find_kevin_bacon(start)
      queue = [start] # queue for unvisited vertices
      visited_nodes = [] # keep track of visited nodes
      meta = {} # use for path formation
      meta[start] = [nil, nil] # [parent_vertex, edge]


    while queue.size > 0
      parent_node = queue.shift #  actor node
      if parent_node.name == "Kevin Bacon"
        return construct_path(parent_node, meta)
      end
      parent_node.film_actor_hash.each_pair do |film, child_nodes|
        child_nodes.each do |child|
          next if visited_nodes.include?(child)
          if !queue.include?(child)
            meta[child] = [parent_node, film]
            queue.push(child)
          end
        end
      end
      visited_nodes.push(parent_node)
    end
    return "No Path to Kevin Bacon"
  end

  private

  def construct_path(node, meta)
    action_list = []

    loop do
      row = meta[node]
      if !row[0].nil?
        node = row[0]
        film = row[1]
        action_list.unshift(film)
      else
        break
      end
    end

    if action_list.size < 7
      return action_list
    else
      return nil
    end
  end

end
