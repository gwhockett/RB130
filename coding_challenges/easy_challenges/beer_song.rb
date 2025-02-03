class BeerSong
  def self.verse(pass)
    case pass
    when 0
      "No more bottles of beer on the wall, no more bottles of beer.\n" \
      "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
    when 1
      "1 bottle of beer on the wall, 1 bottle of beer.\n" \
      "Take it down and pass it around, no more bottles of beer on the wall.\n"
    when 2
      "2 bottles of beer on the wall, 2 bottles of beer.\n" \
      "Take one down and pass it around, 1 bottle of beer on the wall.\n"
    else  
      "#{pass} bottles of beer on the wall, #{pass} bottles of beer.\n" \
      "Take one down and pass it around, #{pass - 1} bottles of beer on the wall.\n" 
    end
  end

  def self.verses(beer_number, last_pass)
    lyrics = []
    beer_number.downto(last_pass) do |pass|
       lyrics << verse(pass)
    end
    lyrics.join("\n")
  end

  def self.lyrics
    verses(99, 0)
  end
end

#puts BeerSong.verse(1)
#puts BeerSong.verses(99, 98)
#puts BeerSong.lyrics