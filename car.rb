class Car
  attr_accessor :wheels, :name

  def initialize
    @wheels = 4
  end

  def ==(other)
    other.is_a?(Car) &&
    wheels == other.wheels &&
    name == other.name
  end
end