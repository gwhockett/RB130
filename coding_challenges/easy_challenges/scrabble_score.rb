=begin
class Scrabble
  SCORE_KEY = {
    'A' => 1,
    'E' => 1,
    'I' => 1,
    'O' => 1,
    'U' => 1,
    'L' => 1,
    'N' => 1,
    'R' => 1,
    'S' => 1,
    'T' => 1,
    'D' => 2,
    'G' => 2,
    'B' => 3,
    'C' => 3,
    'M' => 3,
    'P' => 3,
    'F' => 4,
    'H' => 4,
    'V' => 4,
    'W' => 4,
    'Y' => 4,
    'K' => 5,
    'J' => 8,
    'X' => 8,
    'Q' => 10,
    'Z' => 10
  }
  
  def initialize(word)
    @word = word ? (word.upcase.gsub(/[^A-Z]/, '').chars) : ''.chars
  end

  def score
    points = 0
    @word.each do |letter|
      points += SCORE_KEY[letter]
    end
    points
  end

  def self.score(word)
    Scrabble.new(word).score
  end
end
=end
class Scrabble
  SCORE_KEY = {
    'AEIOULNRST' => 1,
    'DG' => 2,
    'BCMP' => 3,
    'FHVWY' => 4,
    'K' => 5,
    'JX' => 8,
    'QZ' => 10,
  }
  
  def initialize(word)
    @word = word ? word.upcase.gsub(/[^A-Z]/, '').chars : ''.chars
  end

  def score
    points = 0
      SCORE_KEY.each do |letters, point|
        @word.each do |letter|
          points += point if letters.include?(letter)
        end
      end
    points
  end

  def self.score(word)
    Scrabble.new(word).score
  end
end
