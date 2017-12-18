include RSpec
require_relative "route_finder"
require_relative "city"
require_relative "tour"

RSpec.describe RouteFinder, type: Class do

  let(:random_cities) { City.random_cities(10) }
  let(:city_2) { City.new(489,25) }
  let(:city_3) { City.new(75,25) }
  let(:route_finder) { RouteFinder.new(random_cities) }

  describe "#greedy_tsp" do
    context " creates a tour by choosing the nearest neighbor " do
      it 'creates a new tour' do
        tour = route_finder.greedy_tsp(random_cities)
        expect(tour).to (random_cities)
      end
      pending it 'finds the nearest neighbor and adds it to ' do

      end
    end
  end
end
