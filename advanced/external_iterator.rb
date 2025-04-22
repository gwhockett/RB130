n_factors = (0..).to_enum

def factorial_recursion(n)
  return 1 if n == 0
  n = factorial_recursion(n - 1) * n
end

#def factorial_reduce(n)
#  (1..n).reduce(1, :*)
#end
#
#factorial_cache = { 0 = 1 }
#
#def factorial_memoization(n)
#  factorial_cache[n] ||= n * factorial(n - 1)
#end

def factorial_iterator(enumerator, total_iterations)
  iteration = 0
  while iteration < total_iterations
    n = enumerator.next
    puts "#{n}! == #{factorial_recursion(n)}"
    iteration += 1
  end
end

puts n_factors
factorial_iterator(n_factors, 5)
puts "==============="
puts n_factors.rewind
factorial_iterator(n_factors, 3)
puts "==============="
factorial_iterator(n_factors, 7)
puts "==============="

=begin
n_factors = (0..).to_enum
@factorial_cache = {0 => 1}

def factorial(n)
  #return 1 if n == 0
  #n = factorial(n - 1) * n

  #(1..n).reduce(1, :*)
  # `reduce` is better than recursion for code clarity
  #  and resource management

  @factorial_cache[n] ||= n * factorial(n - 1)
  # memoization stores already calculated factorials. (cached)
  # If a factorial `n` key already has a value Ruby will leave that
  # key-value pair and use it for the next factorial calculation if
  # the next factorial key returns nil then store that next new
  # key-value pair. 
end

def factorial_iterator(enumerator, total_iterations)
  #iteration = 0
  #while iteration < total_iterations
  #  n = enumerator.next
  #  puts "#{n}! == #{factorial(n)}"
  #  iteration += 1
  #end

  total_iterations.times do
    n = enumerator.next
    puts "#{n}! == #{factorial(n)}"
  end

  # using `times` is more idiomatic and automatically manages iteration
  # count. It also helps to eliminate off-by-one errors.
 end

puts n_factors
factorial_iterator(n_factors, 7)
puts "==============="
puts n_factors.rewind
factorial_iterator(n_factors, 3)
puts "==============="
factorial_iterator(n_factors, 7)
puts "==============="

class ExIterator


  def initialize(max_iterations)
    @max_iterations = max_iterations
  end
end
=end