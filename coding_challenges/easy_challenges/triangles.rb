=begin
Problem:
Given three number values, each presented as a length of a side of a triangle,
do the three numeric values make a valid triangle?
  Valid triangles must have all side values greater than zero.
  Valid triangles must be made of sides where any one side value is
  less than the sum of the other two side values.

If a valid triangle can be created from the three given numbers,
what kind of triangle is it?
  Is it a equilateral? A triangle where all three sides have equal value.
  Is is a isosceles? A triangle where two side have the same value.
  Is is a scalene? A triangle where all side have uniqe values.

Examples / Test cases:
  1 Three sides: 2, 2, 2
    This would create a valid triangle because all three sides are greater than
    zero. Any two sides summed is larger than the third side. For example,
    2 + 2 > 2
  2 Three sides: 3, 4, 5
    This would create a valid triangle because all three sides ar greater than
    zero. The smallest two sides summed is larger than the largest remaining
    side, so 3 + 4 > 5
  3 Three sides: 1, 2, 2
    This would create a valid triangle because all three sides are longer than
    zero. Also the two smallest sides added together is larger than the
    remaining size: 1 + 2 > 2
  4 Three sides: 1, 2, 3
    This would not create a valid triangle. Even though all three sides are
    larger than zero, 1 + 2 is not larger than 3.
  5 Three sides: 0, 1, 2
    This would not create a valid triangle. One side can not have a length of
    zero. And the smallest two sides are not larger than the third side.
  6 Three sides: -1, 2, 2
    This would not create a valid triangle. One side can not have a negative
    length. And the smallest two sides are not larger than the third side.

  Example 1 is an equilateral triangle becuase all three sides are equivalent
  
  Example 2 is an isosceles triangle because two of the sides are equivalent
  and the remaining side is a different value.
  
  Example 3 is a scalene triangle because all sides have a different value.

Data structure:
  We can use an array to collect and assess the input values.
  Return and output a string.
  
  Using Ruby we can create a class and use the constuctor to validate the input
  values. It will verify that all three 
Algorithm:
  Constructor
    Save the three side lengths
    Check wheter any side length is less than or equal to zero.
      If so, raise an exception.
    Check whether any two sides summed are less than the third side.
      If so, raise an exception.
  Kind
    Compare the values of representing the sides
    If all are equal return 'equilateral'
    If two side are equal and the third is different return 'isosceles'
    If no side are equal return 'scalene'
Code:
  
=end

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
    #if @sides.any? { |side| side <= 0 }  
    #  raise ArgumentError, "All sides must be greater than 0"
    #end
  end
end


#puts Triangle.new(1,2,3).kind