=begin
Problem:
Calculate the Hamming distance or point mutations: The difference between
two strings of equal length. The total point mutations is the Hamming
distance.
The strings only contain Gs As Cs and Ts.
What is considered a difference? Each character in each string has an index
value starting at the left most position. If a corresponding index has
different character value, then that is a point mutation. The maximum number
of point mutations can only be the length of the shorter string.
Example 1:
'GAGCCTACTAACGGGAT'
'CATCGTAATGACGGCCT'
 ^ ^ ^  ^ ^    ^^
This has seven point mutations.
Example 2:
''
''
Zero points
Example 3:
'CATCGTAATGACGGCCT'
'CATCGTAATGACGGCCT'
Zero points
Example 4:
'CATCGTAATGACGGCCT'
'TCCGGCAGTAATGCTAC'
 ^^^^ ^ ^ ^ ^ ^^^^
12 points
Example 5:
'CATCGTAATGACGGCCT'
'TCCGGCAGTAATG'
 ^^^^ ^ ^ ^ ^ 
8 points
Example 6:
'TCCGGCAGTAATG'
'CGATCAGTCTTAC'
 ^^^^^^^^^^^^^
13 points
DATA:
We are given strings as DNA strands
Range objects determined by the string sizes. Maybe convert to an array?
output/return: integer
Algorithm:
Input one string into a constructor and assign a variable
Our class will be called `DNA` as shown by the given tests.

Check for hamming distance
  Input one string into a method called `hamming_distance`
  Determine what string is the shortest
  Use the shortest index as a maximum range value
  our range object.
  Create a result variable pointing to zero
  Iterate through the range object. Each iteration will give us an index value.
      Compare each character of each string at the same index location
        If they are the same then no point value
        If different then one point is added to result
Return the result


Code:
=end
class DNA
  def initialize(strand)
    @strand = strand
  end

  def hamming_distance(hamming_strand)
    shortest = [@strand.size, hamming_strand.size].min
    result = 0
    (0...shortest).each do |idx|
      result += 1 unless @strand[idx] == hamming_strand[idx]
    end
    result
  end
end

test1 = DNA.new('AAAA')
p test1.hamming_distance('BBBB')
