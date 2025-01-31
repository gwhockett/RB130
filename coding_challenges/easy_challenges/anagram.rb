=begin
class Anagram
  def initialize(word)
    @word_chars = word.downcase.chars.sort
    @word = word.downcase
  end

  def match(array)
    array.select do |possible|
      possible.downcase.chars.sort == @word_chars &&
      possible.downcase != @word
    end
  end
end
=end
class Anagram
  def initialize(word)
    @word = word.downcase
  end

  def match(word_array)
    word_array.select do |possible|
      same_sorted_chars?(possible) && not_same_word?(possible)
    end
  end

  def same_sorted_chars?(possible)
    @word.chars.sort == possible.downcase.chars.sort
  end

  def not_same_word?(possible)
    @word != possible.downcase
  end
end