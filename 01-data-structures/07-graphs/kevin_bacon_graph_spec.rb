include RSpec
require "pry"
require_relative "node"
require_relative "kevin_bacon_graph"

RSpec.describe KevinBaconGraph, type: Class do

  let :kevin_bacon { Node.new(name: "Kevin Bacon") }
  let :tom_hanks { Node.new(name: "Tom Hanks") }
  let :jane_fonda { Node.new(name: "Jane Fonda") }
  let :joe_don_baker { Node.new(name: "Jon Don Baker") }
  let :lily_tomlin { Node.new(name: "Lily Tomlin") }
  let :dan_aykroyd { Node.new(name: "Dan Akyroyd") }
  let :christopher_plummer { Node.new(name: "Christopher Plummer") }
  let :brad_pitt { Node.new(name: "Brad Pitt") }
  let :bill_cosby { Node.new(name: "Bill Cosby") }
  let :tom_courtenay { Node.new(name: "Tom Courtenay") }
  let :gary_oldman { Node.new(name: "Gary Oldman") }
  let :elizabeth_perkins { Node.new(name: "Elizabeth Perkins") }
  let :some_guy_1 { Node.new(name: "Some Guy 1") }
  let :some_guy_2 { Node.new(name: "Some Guy 2") }
  let :some_guy_3 { Node.new(name: "Some Guy 3") }
  let :some_guy_4 { Node.new(name: "Some Guy 4") }
  let :some_guy_5 { Node.new(name: "Some Guy 5") }
  let :some_guy_6 { Node.new(name: "Some Guy 6") }
  let :some_guy_7 { Node.new(name: "Some Guy 7") }
  let :some_guy_8 { Node.new(name: "Some Guy 8") }

  let :dragnet {
                  Film.new(
                    name: "Dragnet",
                    actors: [
                      dan_aykroyd,
                      tom_hanks,
                      christopher_plummer,
                      ]
                    )
                  }
  let :beyond_all_boundaries {
                  Film.new(
                    name: "Beyond All Boundaries",
                    actors: [
                      kevin_bacon,
                      brad_pitt,
                      some_guy_1
                      ]
                    )
                  }
  let :leonard_pt_6 {
                  Film.new(
                    name: "Leonard Part 6",
                    actors: [
                      joe_don_baker,
                      bill_cosby,
                      tom_courtenay,
                      ]
                    )
                  }
  let :criminal_law {
                  Film.new(
                    name: "Criminal Law",
                    actors: [
                      kevin_bacon,
                      joe_don_baker,
                      gary_oldman,
                      ]
                    )
                  }
  let :apollo_13 {
                  Film.new(
                    name: "Apollo 13",
                    actors: [
                      kevin_bacon,
                      tom_hanks,
                      ]
                    )
                  }
  let :some_movie_1 {
                  Film.new(
                    name: "some_movie_1",
                    actors: [
                      some_guy_1,
                      some_guy_2,
                      ]
                    )
                  }
  let :some_movie_2 {
                  Film.new(
                    name: "some_movie_2",
                    actors: [
                      some_guy_2,
                      some_guy_3,
                      ]
                    )
                  }
  let :some_movie_3 {
                  Film.new(
                    name: "some_movie_3",
                    actors: [
                      some_guy_3,
                      some_guy_4,
                      ]
                    )
                  }
  let :some_movie_4 {
                  Film.new(
                    name: "some_movie_4",
                    actors: [
                      some_guy_4,
                      some_guy_5,
                      ]
                    )
                  }
  let :some_movie_5 {
                  Film.new(
                    name: "some_movie_5",
                    actors: [
                      some_guy_5,
                      some_guy_6,
                      ]
                    )
                  }
  let :some_movie_6{
                  Film.new(
                    name: "some_movie_6",
                    actors: [
                      some_guy_6,
                      some_guy_7,
                      ]
                    )
                  }
  let :big{
                  Film.new(
                    name: "Big",
                    actors: [
                      dan_aykroyd,
                      tom_hanks,
                      elizabeth_perkins
                      ]
                    )
                  }

  let :test_graph {
    KevinBaconGraph.new(
      actors: [
        kevin_bacon,
        tom_hanks,
        jane_fonda,
        joe_don_baker,
        lily_tomlin,
        dan_aykroyd,
        elizabeth_perkins,
        christopher_plummer,
        some_guy_1,
        some_guy_2,
        some_guy_3,
        some_guy_4,
        some_guy_5,
        some_guy_6,
        some_guy_7,
        some_guy_8,
      ],
      films: [
        dragnet,
        beyond_all_boundaries,
        apollo_13,
        big,
        criminal_law,
        leonard_pt_6,
        some_movie_1,
        some_movie_2,
        some_movie_3,
        some_movie_4,
        some_movie_5,
        some_movie_6,
      ]
    )
  }
  before do
    test_graph.populate_edges
  end

  describe "#populate_edges" do
    it "adds films to the film_actor_hash" do
      expect(some_guy_1.film_actor_hash.keys).to match_array(["some_movie_1", "Beyond All Boundaries" ])
      expect(tom_hanks.film_actor_hash.keys).to match_array(["Dragnet", "Apollo 13", "Big"])
    end

    it 'does not add films to the hash that do not include the actor' do
      expect(some_guy_1.film_actor_hash.keys).not_to include(some_movie_6.name)
    end

    it 'adds actor nodes to each film_actor_hash key correctly' do

      expect(tom_hanks.film_actor_hash["Dragnet"]).to match_array([dan_aykroyd, christopher_plummer])
      expect(some_guy_4.film_actor_hash["some_movie_4"]).to match_array([some_guy_5])

    end
  end

  describe '#find_kevin_bacon' do
    context'kevin_bacon_number is <= 6' do
      it 'returns path when 6 or less lead to Kevin Bacon' do
        expect(test_graph.find_kevin_bacon(some_guy_1)).to match_array([beyond_all_boundaries.name])
      end
      it 'returns path when 6 or less lead to Kevin Bacon' do
        expect(test_graph.find_kevin_bacon(some_guy_3)).to eq([some_movie_2.name, some_movie_1.name, beyond_all_boundaries.name])
      end
      it 'returns path when 6 or less lead to Kevin Bacon' do
        expect(test_graph.find_kevin_bacon(dan_aykroyd)).to match_array([apollo_13.name, dragnet.name])
      end
    end

    context 'kevin_bacon_number > 6' do
      it "notifies the user that it has reached the max" do
        result = test_graph.find_kevin_bacon(some_guy_7)
        expected =  "No Connection Found"
        expect(result).to eq(nil)
      end
    end
    context 'no path to Kevin Bacon' do
      it "notifies the user that no path exists" do
        result = test_graph.find_kevin_bacon(some_guy_8)
        expected =  "No Path to Kevin Bacon"
        expect(result).to eq(expected)
      end
    end
  end

end
