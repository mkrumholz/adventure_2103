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

  describe '#trails_for_experience_level' do
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

      expect(park.trails_for_experience(:moderate)).to eq [trail_2]
    end
  end

  describe '#trails_by_level' do
    it 'returns levels (keys) and lists of trail names (values)' do
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

      expected_1 = {
         :easy => ["Grand Wash"],
         :moderate => ["Cohab Canyon"],
         :strenuous => ["Chimney Rock Loop"]
       }
       expected_2 = {
         :moderate => ["Queen's/Navajo Loop", "Tower Bridge"],
         :easy => ["Rim Trail"]
       }
       expect(park1.trails_by_level).to eq expected_1
       expect(park2.trails_by_level).to eq expected_2
    end
  end

  describe '#visitors_log' do
    it 'returns a hash of visits (values) by year (keys)' do
      details_1 = {
        name: 'Rim Trail',
        length: '11 miles',
        level: :easy
      }
      trail_1 = Trail.new(details_1)
      details_2 = {
        name: 'Queen\'s/Navajo Loop',
        length: '2.9 miles',
        level: :moderate
      }
      trail_2 = Trail.new(details_2)
      details_3 = {
        name: 'Tower Bridge',
        length: '3 miles',
        level: :moderate
      }
      trail_3 = Trail.new(details_3)
      details_4 = {
        name: 'Peekaboo Loop',
        length: '5.5 miles',
        level: :strenuous
      }
      trail_4 = Trail.new(details_4)

      park = Park.new('Bryce Canyon')
      hiker1 = Hiker.new('Dora', :moderate)
      hiker2 = Hiker.new('Frank', :easy)
      hiker3 = Hiker.new('Jack', :strenuous)
      hiker4 = Hiker.new('Sally', :strenuous)

      hiker1.visit(park) # 06/23/1980
      hiker2.visit(park) # 06/24/1980
      hiker3.visit(park) # 06/24/1980
      hiker4.visit(park) # 06/25/1980
      hiker1.visit(park) # 06/23/2020
      hiker2.visit(park) # 06/24/1920
      hiker3.visit(park) # 06/24/1920
      hiker4.visit(park) # 06/25/1920

      expected = {
        1980 => {
          "06/23" => {
            hiker1 => [trail_2, trail_3]
          },
          "06/24" => {
            hiker2 => [trail_1],
            hiker3 => [trail_4]
          },
          "06/25" => {
            hiker4 => [trail_4]
          }
        },
        2020 => {
          "06/23" => {
            hiker1 => [trail_2, trail_3]
          },
          "06/24" => {
            hiker2 => [trail_1],
            hiker3 => [trail_4]
          },
          "06/25" => {
            hiker4 => [trail_4]
            }
        },
      }
      expect(park.visitors_log).to eq expected
    end
  end
end
