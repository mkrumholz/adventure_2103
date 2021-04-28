class Hiker
  attr_reader :name,
              :experience_level,
              :snacks,
              :parks_visited

  def initialize(name, experience_level)
    @name = name
    @experience_level = experience_level
    @snacks = Hash.new(0)
    @parks_visited = []
  end

  def pack(snack, quantity)
    @snacks[snack] += quantity
  end

  def visit(park)
    park.log_visit(self, Date.today)
    @parks_visited << park
  end

  def possible_trails
    @parks_visited.flat_map do |park|
      park.trails_for_experience(@experience_level)
    end
  end

  def favorite_snack
    favorite = @snacks.max_by { |snack, quantity| quantity }
    favorite.first
  end
end
