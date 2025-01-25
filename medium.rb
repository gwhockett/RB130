=begin
class Device
  def initialize
    @recordings = []
  end

  def record(recording)
    @recordings << recording
  end

  def listen
    record(yield) if block_given?
  end

  def play
    puts @recordings.last
  end
end

listener = Device.new
listener.listen { "Hello World!" }
listener.listen
listener.play # Outputs "Hello World!"

class TextAnalyzer
  def process
    puts yield(File.read('sample_text.txt'))

    #given "sandwich" answer
    #text = File.open('sample_text.txt', 'r')
    #puts yield(text.read)
    #text.close
  end
end

analyzer = TextAnalyzer.new

analyzer.process { |text| "#{text.split(/\n\n/).size} paragraphs" }
analyzer.process { |text| "#{text.split(/\n/).size} lines" }
analyzer.process { |text| "#{text.split(' ').size} words" }

items = %w{apples corn cabbage wheat}

def gather(items)
  puts "Lets start gathering food."
  yield(items)
  puts "Nice selection of food we have gathered!"
end

gather(items) { |items| puts "We found #{items.join(', ')}." }

birds = %w(raven finch hawk eagle)

def foul(array)
  yield array
end

p foul(birds) { |_,_,*raptors| raptors }

items = %w(apples corn cabbage wheat)

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

gather(items) do |*first_three, last |
  puts first_three.join(', ')
  puts last
end

puts

gather(items) do |first, *middle_two, last |
  puts first
  puts middle_two.join(', ')
  puts last
end

puts

gather(items) do |first, *last_three |
  puts first
  puts last_three.join(', ')
end

puts

gather(items) do | first, second, third, last |
  puts "#{first}, #{second}, #{third} and #{last}"
end

# Replace the two `method_name` placeholders with actual method calls
def convert_to_base_8(n)
  n.to_s(8).to_i
end

# Replace `argument` with the correct argument below
# `method` is `Object#method`, not a placeholder
base8_proc = method(:convert_to_base_8).to_proc

# We'll need a Proc object to make this code work
# Replace `a_proc` with the correct object
p [8, 10, 12, 14, 16, 33].map(&base8_proc)
=end
#def array_modified?(current, sorted)
#  current == sorted
#end

def swapper(array, idx)
  array[idx], array[idx - 1] = array[idx - 1], array[idx]
end

def bubble_sort!(array, &block)
  loop do
    swapped = false
    (1...array.size).each do |idx|
      if block && block.call(array[idx - 1], array[idx]).equal?(true)
        next
      elsif block && block.call(array[idx - 1], array[idx]).equal?(false)
        swapper(array, idx)
        swapped = true
        next
      elsif block && (block.call(array[idx - 1]) <=> block.call(array[idx])) < 1
        next
      elsif block == nil && (array[idx - 1] <=> array[idx]) < 1
        next
      end
      
      swapper(array, idx)
      swapped = true
    end
    break unless swapped
  end

  array
end

array = [5, 3]
bubble_sort!(array)
p array == [3, 5]

array = [5, 3, 7]
bubble_sort!(array) { |first, second| first >= second }
p array == [7, 5, 3]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
p array == [1, 2, 4, 6, 7]

array = [6, 12, 27, 22, 14]
bubble_sort!(array) { |first, second| (first % 7) <= (second % 7) }
p array == [14, 22, 12, 6, 27]

array = %w(sue Pete alice Tyler rachel Kim bonnie)
bubble_sort!(array)
p array == %w(Kim Pete Tyler alice bonnie rachel sue)

array = %w(sue Pete alice Tyler rachel Kim bonnie)
bubble_sort!(array) { |first, second| first.downcase <= second.downcase }
p array == %w(alice bonnie Kim Pete rachel sue Tyler)

array = %w(sue Pete alice Tyler rachel Kim bonnie)
bubble_sort!(array) { |value| value.downcase }
p array == %w(alice bonnie Kim Pete rachel sue Tyler)