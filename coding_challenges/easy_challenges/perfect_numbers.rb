class PerfectNumber
  def self.classify(number)
    raise StandardError.new if number < 1
    
    sum = divisors_summed_of(number)
    if sum > number
      'abundant'
    elsif sum < number
      'deficient'
    else
      'perfect'
    end
  end

  class << self
    private

    def divisors_summed_of(number)
      (1...number).select do |i|
        number % i == 0
      end.sum
    end
  end
end
