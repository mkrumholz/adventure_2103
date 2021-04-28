require './lib/trail'

describe Trail do
  describe '#initialize' do
    it 'exists' do
      details = {
        name: 'Grand Wash',
        length: '2.2 miles',
        level: :easy
      }
      trail = Trail.new(details)

      expect(trail).is_a? Trail
    end

    it 'has attributes' do
      details = {
        name: 'Grand Wash',
        length: '2.2 miles',
        level: :easy
      }
      trail = Trail.new(details)

      expect(trail.name).to eq 'Grand Wash'
      expect(trail.length).to eq 2.2
      expect(trail.level).to eq :easy
    end
  end
end
