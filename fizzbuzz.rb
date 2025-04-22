# frozen_string_literal: true

# Fizzbuzz
class FizzBuzz
  def initialize(num)
    @num = num
    @result = (1..num).to_a
  end

  def buzz?(int)
    (int % 5).zero? && int % 3 != 0
  end

  def fizz?(int)
    (int % 3).zero? && int % 5 != 0
  end

  def fizzbuzz?(int)
    (int % 3).zero? && (int % 5).zero?
  end

  def result
    @result.map do |int|
      if fizzbuzz?(int) then 'FizzBuzz'
      elsif buzz?(int) then 'Buzz'
      elsif fizz?(int) then 'Fizz'
      else
        int.to_s
      end
    end
  end
end

p FizzBuzz.new(15).result
