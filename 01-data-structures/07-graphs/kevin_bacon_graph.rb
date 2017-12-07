require_relative "node"

class KevinBaconGraph

  attr_reader :actors
  attr_reader :films

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
  def find_kevin_bacon(start)
    queue = [start]
    kbn = 0 # kevin_bacon_number
    path = []
    if start.name == "Kevin Bacon"
      puts "you can't fool this graph"
      return
    end

    while queue.size > 0
      vertex = queue.shift # vertex is an actor node

      vertex.film_actor_hash.each_pair do |film, actors|

        (path.push(film) && kbn += 1) if !path.include?(film)
         actors.each do |actor|

          if actor.name == "Kevin Bacon"
            return path
          else
            queue.push(actor)
          end

        end
      end
      break if kbn == 6
    end

    puts "No Connection Found"
    nil
  end

end
