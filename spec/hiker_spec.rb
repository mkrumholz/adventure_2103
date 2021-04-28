require './lib/trail'
require './lib/park'
require './lib/hiker'

describe Hiker do
  describe '#initialize' do
    it 'exists' do
      hiker = Hiker.new('Dora', :moderate)

      expect(hiker).is_a? Hiker
    end

    it 'has attributes' do
      hiker = Hiker.new('Dora', :moderate)

      expect(hiker.name).to eq 'Dora'
      expect(hiker.experience_level).to eq :moderate
    end

    it 'starts with no snacks' do
      hiker = Hiker.new('Dora', :moderate)

      expect(hiker.snacks).to eq({})
    end

    it 'starts with no parks visited' do
      hiker = Hiker.new('Dora', :moderate)

      expect(hiker.parks_visited).to eq []
    end
  end

  describe '#pack' do
    it 'adds snack and quantity to snacks hash' do
      hiker = Hiker.new('Dora', :moderate)

      hiker.pack('water', 1)
      hiker.pack('trail mix', 3)

      expected = {
        'water' => 1,
        'trail mix' => 3
      }
      expect(hiker.snacks).to eq expected
    end
  end

  describe '#visit_park' do
    it 'adds a park to hiker parks_visited' do
      hiker = Hiker.new('Dora', :moderate)
      park_1 = Park.new('Capitol Reef')
      park_2 = Park.new('Bryce Canyon')

      hiker.visit(park_1)
      hiker.visit(park_2)

      expect(hiker.parks_visited).to eq [park_1, park_2]
    end
  end

  describe '#possible_trails' do
    it 'returns trails from parks_visited matching hiker experience' do
      hiker = Hiker.new('Dora', :moderate)
      details_1 = {
        name: 'Grand Wash',
        length: '2.2 miles',
        level: :easy
      }
      trail_1 = Trail.new(details_1)
      details_2 = {
        name: 'Cohab Canyon',
        length: '1.7 miles',
        level: :moderate
      }
      trail_2 = Trail.new(details_2)
      details_3 = {
        name: 'Chimney Rock Loop',
        length: '3.6 miles',
        level: :strenuous
      }
      trail_3 = Trail.new(details_3)
      details_4 = {
        name: 'Queen\'s/Navajo Loop',
        length: '2.9 miles',
        level: :moderate
      }
      trail_4 = Trail.new(details_4)
      details_5 = {
        name: 'Rim Trail',
        length: '11 miles',
        level: :easy
      }
      trail_5 = Trail.new(details_5)
      details_6 = {
        name: 'Tower Bridge',
        length: '3 miles',
        level: :moderate
      }
      trail_6 = Trail.new(details_6)
      park1 = Park.new('Capitol Reef')
      park2 = Park.new('Bryce Canyon')


      park1.add_trail(trail_1)
      park1.add_trail(trail_2)
      park1.add_trail(trail_3)
      park2.add_trail(trail_4)
      park2.add_trail(trail_5)
      park2.add_trail(trail_6)

      hiker.visit(park1)
      hiker.visit(park2)

      expected = [trail_2, trail_4, trail_6]
      expect(hiker.possible_trails).to eq expected
    end
  end

  describe '#favorite_snack' do
    it 'returns the snack with highest packed quantity' do
      hiker = Hiker.new('Dora', :moderate)

      hiker.pack('water', 1)
      hiker.pack('trail mix', 3)
      hiker.pack('apple', 4)
      hiker.pack('carrot', 3)

      expect(hiker.favorite_snack).to eq 'apple'
    end
  end
end
