=begin
class Octal
  def initialize(str)
    @str = str
  end

  def to_decimal
    decimal_value = 0
    return decimal_value unless valid?
    @str.chars.reverse.each_with_index do |number, idx|
      decimal_value += number.to_i * 8**idx
    end
    decimal_value
  end

  def valid?
    @str.delete('^0-7').size == @str.size
  end 
end

#p Octal.new('234').valid?
=end
class Octal
  def initialize(num_str)
    @num_str = num_str.chars.reverse
  end

  def to_decimal
    return 0 if @num_str.any?(/[^0-7]/)
    sum = 0
    @num_str.each_with_index do |num, exponent|
      sum += num.to_i * (8**exponent)
    end
    sum
  end
end
