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
    @trails.find_all { |trail| trail.length < mileage }
  end

  def hikeable_miles
    @trails.sum { |trail| trail.length }
  end

  def trails_for_experience(level)
    @trails.find_all { |trail| trail.level == level }
  end

  def trails_by_level
    @trails.each_with_object(Hash.new([])) do |trail, trails_by_level|
      level = trail.level
      trails = trails_for_experience(level).map {|trail| trail.name }
      trails_by_level[level] = trails
    end
  end
end
