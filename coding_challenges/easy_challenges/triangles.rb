class Triangle
  attr_reader :sides

  def initialize(*sides)
    @sides = sides.sort
    raise ArgumentError.new, "Invalid side values" unless valid?
  end

  def kind
    case sides.uniq.size
    when 3 then 'scalene'
    when 2 then 'isosceles'
    when 1 then 'equilateral'
    end
  end

  private

  def valid?
    sides.size == 3 && sides[0..1].sum > sides[2]
    # No need to check whether a side is less than or equal to zero
    # if @sides.any? { |side| side <= 0 }
    #   raise ArgumentError, "All sides must be greater than 0"
    # end
  end
end
