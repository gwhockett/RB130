=begin
def step(num1, num2, step_size=1, &block)
  raise ArgumentError if step_size <= 0
  current = num1
  while current <= num2 && block
    block.call(current)
    current += step_size
  end
  num1..num2
end

p step(-10, -2, 2) { |value| puts "value = #{value}" }
p (-10..-2).step(2) { |value| puts "value = #{value}" }

def zip(array1, array2)
  #zipped = []
  #array1.each_with_index do |ele, idx|
  #  zipped << [ele, array2[idx]]
  #end
  #zipped

  #array1.each_with_index.with_object([]) do |(ele, idx), zipped|
  #  zipped << [ele, array2[idx]]
  #end

  (0...array1.size).map { |idx| [array1[idx], array2[idx]] }
end

p zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]

def map(array, &block)
  # mapped = []
  # idx = -array.size
  # while idx < 0 && block
  #     mapped << block.call(array[idx])
  #     idx += 1
  # end
  # mapped
  # my solution does not work with other collections
  mapped = []
  array.each { |ele| mapped << block.call(ele) }
  mapped
end

p map([1, 3, 6]) { |value| value**2 } == [1, 9, 36]
p map([]) { |value| true } == []
p map(['a', 'b', 'c', 'd']) { |value| false } == [false, false, false, false]
p map(['a', 'b', 'c', 'd']) { |value| value.upcase } == ['A', 'B', 'C', 'D']
p map([1, 3, 4]) { |value| (1..value).to_a } == [[1], [1, 2, 3], [1, 2, 3, 4]]

def count(*numbers)
  total = 0
  numbers.each { |number| total += 1 if yield(number) }
  total
end

p count(1, 3, 6) { |value| value.odd? } == 2
p count(1, 3, 6) { |value| value.even? } == 1
p count(1, 3, 6) { |value| value > 6 } == 0
p count(1, 3, 6) { |value| true } == 3
p count() { |value| true } == 0
p count(1, 3, 6) { |value| value - 6 } == 3

def drop_while(array)
  # result = array.clone
  # array.each do |ele|
  #   return result unless yield(ele)
  #   result.shift
  # end
  # result
  idx = 0
  while idx < array.size && yield(array[idx])
    idx += 1
  end
  array[idx..-1]
end

p drop_while([1, 3, 5, 6]) { |value| value.odd? } == [6]
p drop_while([1, 3, 5, 6]) { |value| value.even? } == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| true } == []
p drop_while([1, 3, 5, 6]) { |value| false } == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| value < 5 } == [5, 6]
p drop_while([]) { |value| true } == []

def each_with_index(array)
  idx = 0
  array.each { |ele| yield(ele, idx); idx += 1 }
end

result = each_with_index([1, 3, 6]) do |value, index|
  puts "#{index} -> #{value**index}"
end

puts result == [1, 3, 6]

def each_with_object(array, collection)
  array.each { |ele| yield(ele, collection) }
  collection
end

result = each_with_object([1, 3, 5], []) do |value, list|
  list << value**2
end
p result == [1, 9, 25]

result = each_with_object([1, 3, 5], []) do |value, list|
  list << (1..value).to_a
end
p result == [[1], [1, 2, 3], [1, 2, 3, 4, 5]]

result = each_with_object([1, 3, 5], {}) do |value, hash|
  hash[value] = value**2
end
p result == { 1 => 1, 3 => 9, 5 => 25 }

result = each_with_object([], {}) do |value, hash|
  hash[value] = value * 2
end
p result == {}

def max_by(array)
  largest = array[0]
  array.each do |ele|
    largest = ele if yield(ele) > yield(largest)
  end
  largest
end

p max_by([1, 5, 3]) { |value| value + 2 } == 5
p max_by([1, 5, 3]) { |value| 9 - value } == 1
p max_by([1, 5, 3]) { |value| (96 - value).chr } == 1
p max_by([[1, 2], [3, 4, 5], [6]]) { |value| value.size } == [3, 4, 5]
p max_by([-7]) { |value| value * 3 } == -7
p max_by([]) { |value| value + 5 } == nil

def each_cons(array, slice=2)
  (0...array.length).each do |idx|
    unless array[idx, slice].size < slice
      yield(array[idx], array[idx + (slice-1)])
    end
  end
  nil
end

hash = {}
result = each_cons([1, 3, 6, 10], 2) do |value1, value2|
  hash[value1] = value2
end
p result == nil
p hash == { 1 => 3, 3 => 6, 6 => 10 }

hash = {}
result = each_cons([], 2) do |value1, value2|
  hash[value1] = value2
end
p hash == {}
p result == nil

hash = {}
result = each_cons(['a', 'b'], 2) do |value1, value2|
  hash[value1] = value2
end
p hash == {'a' => 'b'}
p result == nil
=end

def each_cons(array, cons=1)
  (0...array.length).each do |idx|
    unless array[idx...idx + cons].size < cons
      yield(*array[idx...idx + cons])
    end
  end
  nil
end

def each_cons(ary, cons_size=2)
  start = 0
  last = cons_size - 1
  while last < ary.size
    yield(*ary[start, cons_size])
    # use of the splat turn each element of the array into its own argument
    start += 1
    last += 1
  end

  nil
end

hash = {}
each_cons([1, 3, 6, 10], 3) do |value1, *values| # splat collects all remaining arugments into an array
  hash[value1] = values
end
p hash == { 1 => [3, 6], 3 => [6, 10] }

hash = {}
each_cons([1, 3, 6, 10], 1) do |value|
  hash[value] = true
end
p hash == { 1 => true, 3 => true, 6 => true, 10 => true }

hash = {}
each_cons([1, 3, 6, 10], 2) do |value1, value2|
  hash[value1] = value2
end
p hash == { 1 => 3, 3 => 6, 6 => 10 }

hash = {}
each_cons([1, 3, 6, 10], 3) do |value1, *values|
  hash[value1] = values
end
p hash == { 1 => [3, 6], 3 => [6, 10] }

hash = {}
each_cons([1, 3, 6, 10], 4) do |value1, *values|
  hash[value1] = values
end
p hash == { 1 => [3, 6, 10] }

hash = {}
each_cons([1, 3, 6, 10], 5) do |value1, *values|
  hash[value1] = values
end
p hash == {}