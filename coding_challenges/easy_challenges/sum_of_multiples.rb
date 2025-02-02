class SumOfMultiples
  def initialize(*divisors)
    @divisors = divisors.empty? ? [3, 5] : divisors
  end

  def to(natural)
    (1...natural).select do |i|
      @divisors.any? { |div| (i % div).zero? }
    end.sum
  end

  def self.to(number)
    new().to(number)
  end
end