require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/chisel'
require 'pry'

class ChiselTest < Minitest::Test

  def test_chisel_exists
    chisel = Chisel.new(nil)
    assert_instance_of Chisel, chisel
  end

  def test_chisel_has_input
    chisel = Chisel.new(nil)
    assert_nil chisel.input
  end

  def test_convert_single_hashtag_to_h1
    chisel = Chisel.new("#")
    assert_equal chisel.convert_single_hashtag_to_h1, "<h1>"
  end

  def test_convert_double_hashtag_to_h2
    chisel = Chisel.new("##")
    assert_equal chisel.convert_double_hashtag_to_h2, "<h2>"
  end

  def test_convert_entire_string_to_html_with_hashtag
    chisel = Chisel.new("#")
    assert_equal chisel.convert_entire_string_to_html, "<h1>"
  end

  def test_convert_entire_string_to_html_with_hashtag_and_two_chars
    chisel = Chisel.new("#A")
    assert_equal chisel.convert_entire_string_to_html, "<h1>A"
  end

  def test_convert_entire_string_to_html_with_hashtag_and_two_words
    chisel = Chisel.new("#A bug#")
    assert_equal chisel.convert_entire_string_to_html, "<h1>A bug<h1>"
  end

  def test_convert_method_with_double_hashtag
    chisel = Chisel.new("##")
    assert_equal chisel.convert, "<h2>"
  end

end
