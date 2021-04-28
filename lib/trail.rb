class Trail
  attr_reader :name,
              :length,
              :level

  def initialize(details)
    @name = details[:name]
    @length = details[:length].to_f
    @level = details[:level]
  end
end
