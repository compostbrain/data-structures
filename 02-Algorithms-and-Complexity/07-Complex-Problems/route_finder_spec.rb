include RSpec
require_relative "route_finder"
require_relative "city"
require_relative "tour"

RSpec.describe RouteFinder, type: Class do


  let(:new_york) { City.new(40.7, 74) }
  let(:los_angeles) { City.new(34, 118.2) }
  let(:chicago) { City.new(41.8, 87.6) }
  let(:houston) { City.new(29.8, 95.4) }
  let(:philadelphia) { City.new(40, 75.2) }
  let(:phoenix) { City.new(33.4, 112.1) }
  let (:columbus) {City.new(40, 83)}
  let (:charlotte) {City.new(35.2, 80.8)}
  let (:detroit) {City.new(42.3, 83)}
  let (:memphis) {City.new(35.1, 90)}
  let (:seattle) {City.new(47.6, 122.3)}
  let (:denver) {City.new(39.7, 105)}
  let (:washington) {City.new(38.9, 77)}
  let(:route_finder) { RouteFinder.new([new_york]) }
  describe "#greedy_tsp" do
    context " creates a tour by choosing the nearest neighbor " do

      it 'finds an approximation of the shortest path' do
        cities = [new_york,los_angeles, chicago, philadelphia]
        tour = route_finder.greedy_tsp(cities, start = new_york)
        expect(tour.cities).to eq([new_york, philadelphia, chicago, los_angeles])
      end
      it 'finds an approximation of the shortest path' do
        cities = [houston,los_angeles, phoenix, philadelphia]
        tour = route_finder.greedy_tsp(cities, start = los_angeles)
        expect(tour.cities).to eq([los_angeles, phoenix, houston, philadelphia])
      end
      it 'finds an approximation of the shortest path' do
        cities = [denver, seattle, washington, memphis ,detroit]
        tour = route_finder.greedy_tsp(cities, start = seattle)
        expect(tour.cities).to eq([seattle, denver, memphis, detroit, washington])
      end
    end
  end
end
