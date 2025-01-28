require 'minitest/autorun'
require_relative 'triangles'

class TriangleTeste < Minitest::Test
  def test_equilateral_equal_sides
    triangle = Triangle.new(2, 2, 2)
    assert_equal 'equilateral', triangle.kind
  end

  def test_larger_equilateral_equal_sides
    #skip
    triangle = Triangle.new(10, 10, 10)
    assert_equal 'equilateral', triangle.kind
  end

  def test_isosceles_last_two_sides_equal
    #skip
    triangle = Triangle.new(3, 4, 4)
    assert_equal 'isosceles', triangle.kind
  end

  def test_isosceles_first_last_sides_equal
    #skip
    triangle = Triangle.new(4, 3, 4)
    assert_equal 'isosceles', triangle.kind
  end

  def test_isosceles_first_two_sides_equal
    #skip
    triangle = Triangle.new(4, 4, 3)
    assert_equal 'isosceles', triangle.kind
  end

  def test_scalene_no_sides_equal
    #skip
    triangle = Triangle.new(3, 4, 5)
    assert_equal 'scalene', triangle.kind
  end

  def test_scalene_larger_no_sides_equal
    #skip
    triangle = Triangle.new(10, 11, 12)
    assert_equal 'scalene', triangle.kind
  end

  def test_scalene_descending
    #skip
    triangle = Triangle.new(5, 4, 3)
    assert_equal 'scalene', triangle.kind    
  end

  def test_scalene_small_sides
    #skip
    triangle = Triangle.new(0.4, 0.6, 0.5)
    assert_equal 'scalene', triangle.kind
  end

  def test_no_size_invalid
    #skip
    assert_raises(ArgumentError) do
      triangle = Triangle.new(0, 0, 0)
    end
  end

  def test_negative_size_invalid
    #skip
    assert_raises(ArgumentError) do
      triangle = Triangle.new(-1, 2, 3)
    end
  end

  def test_size_inequality_invalid
    #skip
    assert_raises(ArgumentError) do
      triangle = Triangle.new(1, 1, 3)
    end
  end

  def test_size_inequality_invalid_2
    #skip
    assert_raises(ArgumentError) do
      triangle = Triangle.new(12, 1, 3)
    end
  end

  def test_size_inequality_invalid_3
    #skip
    assert_raises(ArgumentError) do
      triangle = Triangle.new(3, 5, 1)
    end
  end

  def test_size_inequality_invalid_4
    #skip
    assert_raises(ArgumentError) do
      triangle = Triangle.new(1, 1, 3)
    end
  end
end