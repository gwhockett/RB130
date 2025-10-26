# frozen_string_literal: false

class RomanNumeral
  attr_reader :digits

  ROMAN_NUMERALS = {  
    "I" => 1,
    "IV" => 4,
    "V" => 5,
    "IX" => 9,
    "X" => 10,
    "XL" => 40,
    "L" => 50,
    "XC" => 90,
    "C" => 100,
    "CD" => 400,
    "D" => 500,
    "CM" => 900,
    "M" => 1000
  }


  def initialize(digits)
    @digits = digits
  end
  
  def to_roman
    number = digits
    roman_numeral = ''
    
    while number > 0
      current_value = 0
      current_numeral = ''
      ROMAN_NUMERALS.each do |k, v|
        if number - v >= 0 && v > current_value
          current_value = v
          current_numeral = k
        end
      end
      number -= current_value
      roman_numeral += current_numeral
    end
  
    roman_numeral
  end
end
=begin
class RomanNumeral
  attr_reader :digits

  ROMAN_NUMERALS = {  
    "M" => 1000,
    "CM" => 900,
    "D" => 500,
    "CD" => 400,
    "C" => 100,
    "XC" => 90,
    "L" => 50,
    "XL" => 40,
    "X" => 10,
    "IX" => 9,
    "V" => 5,
    "IV" => 4,
    "I" => 1
  }


  def initialize(digits)
    @digits = digits
  end
  
  def to_roman
    number = digits
    roman_numeral = ''
    
    while number > 0
      ROMAN_NUMERALS.each do |k, v|
        if number - v >= 0
          roman_numeral += k
          number -= v
          break
        end
      end
    end
  
    roman_numeral
  end
end

class RomanNumeral
  attr_reader :digits

  ROMAN_NUMERALS = {  
    'MMM' => 3000,
    'MM' => 2000,
    'M' => 1000,
    'CM' => 900,
    'DCCC' => 800,
    'DCC' => 700,
    'DC' => 600,
    'D' => 500,
    'CD' => 400,
    'CCC' => 300,
    'CC' => 200,
    'C' => 100,
    'XC' => 90,
    'LXXX' => 80,
    'LXX' => 70,
    'LX' => 60,
    'L' => 50,
    'XL' => 40,
    'XXX' => 30,
    'XX' => 20,
    'X' => 10,
    'IX' => 9,
    'VIII' => 8,
    'VII' => 7,
    'VI' => 6,
    'V' => 5,
    'IV' => 4,
    'III' => 3,
    'II' => 2,
    'I' => 1
  }


  def initialize(digits)
    @digits = digits
  end
  
  def to_roman
    number = digits
    roman_numeral = ''
    
    ROMAN_NUMERALS.each do |k, v|
      if number - v >= 0
        roman_numeral += k
        number -= v
      end
    end
    roman_numeral
  end

end
=end