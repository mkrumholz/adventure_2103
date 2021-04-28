class Park
  attr_reader :name,
              :trails

  def initialize(name)
    @name = name
    @trails = []
  end

  def add_trail(trail)
    @trails << trail
  end

  def trails_shorter_than(mileage)
    @trails.find_all do |trail|
      trail.length < mileage
    end
  end

  def hikeable_miles
    @trails.sum { |trail| trail.length }
  end

  def trails_by_level(level)
    @trails.find_all do |trail|
      trail.level == level
    end
  end
end
