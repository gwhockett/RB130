=begin
class Tree
  include Enumerable
  attr_reader :array

  def initialize
    @array = (1..10).to_a.shuffle
  end

  def each
    counter = 0

    while counter < array.size
      yield(@array.clone[counter]) if block_given?
      counter += 1
    end

    self
  end
end

tree = Tree.new
puts tree.minmax

# Futher Exploration
def compute(obj=nil, &block)
  block_given? ? block.call(obj) : 'Does not compute.'
end

p compute(4) { |obj| obj + obj*2 } == 12
p compute("x") { |obj| obj*3*3 } == "xxxxxxxxx"
p compute == 'Does not compute.'
p compute(2, &:abs2) == 4
p compute(4) { |n| n.abs2 } == 16
p compute("hello", &:upcase) == "HELLO"

def missing(ary)
  #(ary[0]..ary[-1]).to_a - ary
  #(ary[0]..ary[-1]).to_a.difference(ary)
  #Launch School solution
  result = []

  ary.each_cons(2) do |first, second|
    result.concat(((first + 1)..(second - 1)).to_a)
  end

  result
end

p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []

def time_it
  start_time = Time.now
  yield if block_given?
  end_time = Time.now
  puts "Took #{end_time - start_time} sec."
end

def divisors_to_i(num)
  result = []

  (1..Math.sqrt(num).to_i).each do |i|
    if (num % i).zero?
      result << i
      result << num / i 
    end
  end

  result.uniq.sort
end

def divisors(num)
  result = []

  (1..Math.sqrt(num)).each do |i|
    if (num % i).zero?
      result << i
      result << num / i 
    end
  end

  result.uniq.sort
end

p divisors(1) == [1]
p divisors(7) == [1, 7]
p divisors(12) == [1, 2, 3, 4, 6, 12]
p divisors(98) == [1, 2, 7, 14, 49, 98]

time_it { p divisors_to_i(999962000357) == [1, 999979, 999983, 999962000357] }
time_it { p divisors(999962000357) == [1, 999979, 999983, 999962000357] }

code_key = {}

upper1 = ('A'..'M').to_a.freeze
upper2 = ('N'..'Z').to_a.freeze
lower1 = ('a'..'m').to_a.freeze
lower2 = ('n'..'z').to_a.freeze

(0..12).each do |idx|
  code_key[upper1[idx]] = upper2[idx]
  code_key[lower1[idx]] = lower2[idx]
end

CODE_KEY = code_key.merge(code_key.invert)

NAMES = ["Nqn Ybirynpr",
         "Tenpr Ubccre",
         "Nqryr Tbyqfgvar",
         "Nyna Ghevat",
         "Puneyrf Onoontr",
         "Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv",
         "Wbua Ngnanfbss",
         "Ybvf Unvog",
         "Pynhqr Funaaba",
         "Fgrir Wbof",
         "Ovyy Tngrf",
         "Gvz Orearef-Yrr",
         "Fgrir Jbmavnx",
         "Xbaenq Mhfr",
         "Fve Nagbal Ubner",
         "Zneiva Zvafxl",
         "Lhxvuveb Zngfhzbgb",
         "Unllvz Fybavzfxv",
         "Tregehqr Oynapu"].freeze

def rot13_decrypt(string)
  decryption = ''

  (0...string.size).each do |character|
    if CODE_KEY[string[character]]
      decryption << CODE_KEY[string[character]]
    else
      decryption << string[character]
    end
  end

  decryption
end

puts NAMES.map { |name| rot13_decrypt(name)}

def any?(collection)
  # using `each` allows this to work with any Enumerable collection: Arrays, Hashes, Sets, etc.
  collection.each { |item| return true if yield (item) }
  false
end

# p any?([1, 3, 5, 6]) { |value| value.even? }# == true
# p any?([1, 3, 5, 7]) { |value| value.even? }# == false
# p any?([2, 4, 6, 8]) { |value| value.odd? }# == false
# p any?([1, 3, 5, 7]) { |value| value % 5 == 0 }# == true
# p any?([1, 3, 5, 7]) { |value| true }# == true
# p any?([1, 3, 5, 7]) { |value| false }# == false
# p any?([]) { |value| true }# == false

def all?(collection)
  collection.each { |item| return false unless yield(item) }
  true
end

#  all?([1, 3, 5, 6]) { |value| value.odd? } == false
#  all?([1, 3, 5, 7]) { |value| value.odd? } == true
#  all?([2, 4, 6, 8]) { |value| value.even? } == true
#  all?([1, 3, 5, 7]) { |value| value % 5 == 0 } == false
#  all?([1, 3, 5, 7]) { |value| true } == true
#  all?([1, 3, 5, 7]) { |value| false } == false
#  all?([]) { |value| false } == true

def none?(collection, &block)
  !any?(collection, &block)
end

p none?([1, 3, 5, 6]) { |value| value.even? } == false
p none?([1, 3, 5, 7]) { |value| value.even? } == true
p none?([2, 4, 6, 8]) { |value| value.odd? } == true
p none?([1, 3, 5, 7]) { |value| value % 5 == 0 } == false
p none?([1, 3, 5, 7]) { |value| true } == false
p none?([1, 3, 5, 7]) { |value| false } == true
p none?([]) { |value| true } == true

def one?(collection)
  # truthies = 0
  # collection.each do |ele|
  #   truthies += 1 if yield(ele)
  #   break if truthies > 1
  # end
  # truthies == 1

  seen_one = false
  collection.each do |ele|
    next unless yield(ele)
    return false if seen_one
    seen_one = true
  end
  seen_one
end

p one?([1, 3, 5, 6]) { |value| value.even? }    # -> true
p one?([1, 3, 5, 7]) { |value| value.odd? }     # -> false
p one?([2, 4, 6, 8]) { |value| value.even? }    # -> false
p one?([1, 3, 5, 7]) { |value| value % 5 == 0 } # -> true
p one?([1, 3, 5, 7]) { |value| true }           # -> false
p one?([1, 3, 5, 7]) { |value| false }          # -> false
p one?([]) { |value| true }                     # -> false
=end

def count(collection, &block)
  #truthies = 0
  #collection.each { |ele| truthies += 1 if yield(ele) }
  #truthies

  collection.select(&block).size
end

p count([1,2,3,4,5]) { |value| value.odd? } == 3
p count([1,2,3,4,5]) { |value| value % 3 == 1 } == 2
p count([1,2,3,4,5]) { |value| true } == 5
p count([1,2,3,4,5]) { |value| false } == 0
p count([]) { |value| value.even? } == 0
p count(%w(Four score and seven)) { |value| value.size == 5 } == 2