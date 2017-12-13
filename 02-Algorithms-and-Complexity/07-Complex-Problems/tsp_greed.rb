# nearest neighbor
require "pry"
require_relative "city.rb"
require_relative "tour.rb"


srand

cities8, cities10, cities100, cities1000 =
  [8, 10, 100, 1000].map { |n|
    City.random_cities(n)
  }



  def all_tours(cities)
    start = cities.first
    (cities - [start]).permutation.map { |permutation|
      Tour.new([start] + permutation)
    }
  end

def exact_tsp(cities)
  shortest(all_tours(cities))
end

def shortest(tours)
  tours.min_by(&:distance)
end

def greedy_tsp(cities, start = nil)
  start ||= cities.first # memoization 
  tour = [start]
  unvisited = cities - [start]
  loop do
    break unless unvisited.any?
    c = nearest_neighbor(tour[-1], unvisited)
    tour.push(c)
    unvisited.delete(c)
  end

  Tour.new(tour)
end

def nearest_neighbor(a, cities)
  cities.min_by { |city| City.distance(a, city) }
end

tour_1 = greedy_tsp(cities8)
tour_2 = greedy_tsp(cities1000)

puts tour_1.cities
puts tour_1.distance
puts tour_2.cities
puts tour_2.distance
