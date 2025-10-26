require 'minitest/autorun'
require_relative 'text'

class TextTest < Minitest::Test
  def setup
    @textfile = File.open('sample_text.txt', 'r')
  end

  def test_swap
    textfile_string = Text.new(@textfile.read)
    swapped_text = textfile_string.swap('a', 'e')
    expected = <<~TEXT.chomp
    Lorem ipsum dolor sit emet, consectetur edipiscing elit. Cres sed vulputete ipsum.
    Suspendisse commodo sem ercu. Donec e nisi elit. Nullem eget nisi commodo, volutpet
    quem e, viverre meuris. Nunc viverre sed messe e condimentum. Suspendisse ornere justo
    nulle, sit emet mollis eros sollicitudin et. Etiem meximus molestie eros, sit emet dictum
    dolor ornere bibendum. Morbi ut messe nec lorem tincidunt elementum vitee id megne. Cres
    et verius meuris, et pheretre mi.
    TEXT

    assert_equal(expected, swapped_text)
  end

  def test_word_count
    textfile_string = Text.new(@textfile.read)
    assert_equal(72, textfile_string.word_count)
  end

  def teardown
    @textfile.close
  end
end