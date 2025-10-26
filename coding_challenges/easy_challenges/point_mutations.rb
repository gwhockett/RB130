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
