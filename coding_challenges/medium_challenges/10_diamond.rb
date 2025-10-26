=begin
class Diamond
  ALPHA = ('A'..'Z').to_a
  def self.make_diamond(letter)
    return "A\n" if letter == 'A'
    a_spaces = " " * ALPHA.index(letter)
    string_stack = ["#{a_spaces}" + 'A' + "#{a_spaces}"]
    (1..ALPHA.index(letter)).each do |idx|
      side_spaces = ALPHA.index(letter) - idx
      middle_space = (idx * 2) - 1
      string_stack << (" " * (side_spaces)) +
      ALPHA[idx] +
      (" " * middle_space) +
      ALPHA[idx] +
      (" " * (side_spaces))
    end
    string_stack += string_stack[0..-2].reverse
    string_stack.join("\n") + "\n"
  end
end

class Diamond
  def self.make_diamond(letter)
    letters = ('A'..letter.upcase).to_a
    x_position = letters.reverse + letters[1..-1]
    y_position = letters + letters[0..-2].reverse

    diamond = ''
    y_position.each do |y|
      diamond += x_position.map { |x| x == y ? x : ' ' }.join + "\n"
    end
    puts diamond
  end

  def self.make_diamond_with_x(letter)
    letters = ('A'..letter.upcase).to_a
    y_position = letters + letters[0..-2].reverse
    x_position = letters.reverse + letters[1..-1]
    x_position_2 = x_position.zip(y_position)

    diamond_x = ''
    y_position.each do |y|
      diamond_x += x_position_2.map do |x2|
        y == x2[0] || y == x2[1] ? y : ' '
      end.join + "\n"
    end
    puts diamond_x
  end
end

Diamond.make_diamond('n')
Diamond.make_diamond_with_x('n')
=end

class Diamond
  SPACE_SIZE = {
    "B" => 1,
    "C" => 3,
    "D" => 5,
    "E" => 7
  }

  def self.make_diamond(middle_letter)
    return "A\n" if middle_letter == "A"
    diamond_seed = []

    diamond_letters = ("A"..middle_letter).to_a.reverse
    diamond_letters.each_with_index do |letter, space|
      if letter == "A"
        diamond_seed << "#{' ' * space}#{letter}#{' ' * space}"
      else
        diamond_seed << "#{' ' * space}#{letter}#{' ' * SPACE_SIZE[letter]}" \
                        "#{letter}#{' ' * space}"
      end
    end
    diamond = diamond_seed.reverse[0..-2] + diamond_seed
    "#{diamond.join("\n")}\n"
  end
end
