# city class

class City

  attr_reader :complex

  def initialize(x,y)
    @complex = Complex(x,y)
  end

  def self.distance(city_a, city_b)
    (city_a.complex - city_b.complex).abs
  end

  def self.random_cities(n)
    n.times.map { City.new(rand(10..500), rand(10..850)) }
  end


end
