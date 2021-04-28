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
end
