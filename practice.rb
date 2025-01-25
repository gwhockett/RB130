require 'minitest/autorun'

class Cat
  attr_accessor :name, :purr_factor

  def initialize(name, purr_factor)
    @name = name
    @purr_factor = purr_factor
  end

  def miaow
    "#{name} is miaowing."
  end
end

class CatTest < Minitest::Test
  def setup
    @kitty = Cat.new('Kitty', 8)
  end

  def test_is_cat; end

  def test_name
    assert_equal('Milo', @kitty.name)
  end

  def test_miaow
    assert_match(/ is miaowing\./, @kitty.miaow)
  end

  def test_raises_error
    assert_raises(ArgumentError) do
      Cat.new
    end
  end

  def test_is_not_purrier
    patch = Cat.new('Patch', 5)
    milo = Cat.new('Milo', 3)
  
    refute(patch.purr_factor < milo.purr_factor)
  end
end