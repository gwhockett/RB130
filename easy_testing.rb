require 'minitest/autorun'

class NoExperienceError < StandardError; end

class Employee
  def initialize
    @experience = [true, false].sample
  end

  def experience?
    @experience
  end

  def hire
    raise NoExperienceError,"Needs experience" unless experience?
    p "hired"
  end
end

def employee_hire
  Employee.new.hire
end

class TestExercise < Minitest::Test
  #def test_odd_question
  #  value = 4
  #  assert value.odd?, 'value is not odd'
  #  #assert_equal(false, 4.odd?)
  #  #assert_equal(true, 3.odd?)
  #end

  #def test_downcase
  #  #when using `assert_equal` the first argument should represent the expected
  #  #value. The second argument is the actual value tested.
  #  assert_equal 'xyz', 'XyZ'.downcase 
  #end

  #def test_nil
  #  #assert_nil false, "This is not nil"
  #  assert_nil nil, "This is not nil"
  #end

  #def test_empty_list
  #  list = [1]
  #  assert_empty list # has a clear failure message
  #  #assert_equal true, list.empty?
  #end

  #def test_list_includes
  #  list = []
  #  assert_includes list, 'xyz', '`list` does not include `"xyz"`'
  #end

  #def test_experience_error
  #  assert_raises(NoExperienceError) {employee_hire}
  #end

  #def test_numeric_instance
  #  value = 1
  #  assert_instance_of(Numeric, value, "not a Numeric class object")
  #end

  #def test_numeric_type
  #  value = '1'
  #  assert_kind_of(Numeric, value, "KK")
  #end
  
  #def test_same_object
  #  list = "hello"
  #  list.define_singleton_method(:process) { [list.upcase, list.upcase!].sample }
  #  assert_same list, list.process
  #end

  def test_refute_includes
    list = ['xyz']
    refute_includes list, 'xyz'
  end
end