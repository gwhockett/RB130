=begin
Problem:
Convert the string of an octal number to decimal.
Anything other than the numbers zero to seven is invalid
input.
Invalid input returns `0`
No library method use for implementation of conversion.
Create bespoke code for implementation of the conversion.

nth digit, counting from the right starting with a value
of 0, nth digit value times the base value raised to the power of n-1.

Examples and test cases:

233 converted to octal -> 155
(2*8^2) + (3*8^1) + (3*8^0) = 155

1 converted to octal 1
(1 * 8^0) = 1

23 converted to octal 19
(2 * 8^1) + (3 * 8^0) -> 3 + 16 = 19

'abc1' => 0
'beans' => 0
'one' => 0
=end
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

