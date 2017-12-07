class Node

  attr_accessor :name
  attr_accessor :film_actor_hash


  def initialize(name:)
    @name = name
    @film_actor_hash = {}
  end

  def add_film(film)
    if film.actors.include?(self)

      actors_array = []
      film.actors.each do |actor|
        actors_array << actor if actor != self
      end
      @film_actor_hash[film.name] = actors_array

    else
      puts "#{film.name} does not contain #{name}"
    end


  end
end

class Film

  attr_reader :actors
  attr_reader :name

  def initialize(name:, actors:)
    @name = name
    @actors = actors

  end
end
