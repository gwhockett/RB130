def reduce(collection, accumulator=nil, &block)
  collection = collection.to_a

  if accumulator
    accumulator = collection.first
    collection.each { |ele| accumulator = block.call(accumulator, ele)}
  else
    accumulator = collection.shift
    collection.each { |ele| accumulator = block.call(accumulator, ele)}
  end

  accumulator
end

p reduce((1..2), 1, &:+)
p reduce((1..2)) { |sum, ele| sum + ele }