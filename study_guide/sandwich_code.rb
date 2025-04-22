#def logger
#  level = 0
#  
#  Proc.new do |message, &block|
#    puts "  " * level + "START: #{message}"
#    level += 1
#    
#    result = block.call
#    
#    level -= 1
#    puts "  " * level + "FINISH: #{message} (Result: #{result})"
#    
#    result
#  end
#end
#
#log = logger
#
#result = log.call("outer task") do
#  log.call("inner task") do
#    "inner task completed"
#  end
#  
#  "outer task completed"
#end
#
#puts "Final result: #{result}"

def factorial_reduce(n)
  (1..n).reduce(1, :*)
end

def factorial_recursion(n)
  return 1 if n == 0
  n = factorial_recursion(n - 1) * n
end

def factorial_array_memoization(n, cache=[1])
  return 1 if n == 0
  cache << n * factorial_array_memoization(n - 1, cache) unless cache.any?(n)
  cache[-1]
end

def factorial_hash_memoization(n, cache = {})
  return 1 if n == 0
  cache[n] ||= n * factorial_hash_memoization(n - 1, cache)
  cache[n]
end

def elapsed_time
  starting_time = Time.now
  code_cycled = yield
  finishing_time = Time.now
  finishing_time - starting_time
end

p elapsed_time {1000.times {factorial_reduce(4000)}}
p elapsed_time {1000.times {factorial_recursion(4000)}}
p elapsed_time {1000.times {factorial_array_memoization(4000)}}
p elapsed_time {1000.times {factorial_hash_memoization(4000)}}