class SumOfMultiples
  def initialize(*divisors)
    @divisors = ((divisors.size == 0) ? [3, 5] : divisors)
  end

  def to(natural)
    multiples = []
    (1...natural).each do |i|
      @divisors.each do |div|
        multiples << i if i % div == 0
      end
    end
    multiples.uniq.sum
  end

  def self.to(number)
    SumOfMultiples.new.to(number)
  end
end