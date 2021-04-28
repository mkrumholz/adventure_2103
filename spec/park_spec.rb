require './lib/trail'
require './lib/park'

describe Park do
  describe '#initialize' do
    it 'exists' do
      park = Park.new('Capitol Reef')

      expect(park).is_a? Park
    end

    it 'has a name' do
      park = Park.new('Capitol Reef')

      expect(park.name).to eq 'Capitol Reef'
    end

    it 'starts with no trails' do
      park = Park.new('Capitol Reef')

      expect(park.trails).to eq []
    end
  end

  describe '#add_trail' do
    it 'adds a trail to trails array' do
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
      park = Park.new('Capitol Reef')

      park.add_trail(trail_1)
      park.add_trail(trail_2)

      expect(park.trails).to eq [trail_1, trail_2]
    end
  end
end
