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

  describe '#trails_shorter_than' do
    it 'returns a list of trails shorter than mileage spec' do
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
      park = Park.new('Capitol Reef')

      park.add_trail(trail_1)
      park.add_trail(trail_2)
      park.add_trail(trail_3)

      actual = park.trails_shorter_than(2.5)
      expect(actual).to eq [trail_1, trail_2]
    end
  end

  describe '#hikeable_miles' do
    it 'returns the total mileage of park trails' do
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
      park = Park.new('Capitol Reef')

      park.add_trail(trail_1)
      park.add_trail(trail_2)
      park.add_trail(trail_3)

      expect(park.hikeable_miles).to eq 7.5
    end
  end

  describe '#trails_by_level' do
    it 'returns trails at specified level' do
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
      park = Park.new('Capitol Reef')

      park.add_trail(trail_1)
      park.add_trail(trail_2)
      park.add_trail(trail_3)

      expect(park.trails_by_level(:moderate)).to eq [trail_2]
    end
  end
end
