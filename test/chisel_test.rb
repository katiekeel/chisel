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
    chisel = Chisel.new("# ")
    assert_equal chisel.convert_entire_string_to_html, "<h1>"
  end

  def test_convert_double_hashtag_to_h2
    chisel = Chisel.new("## ")
    assert_equal chisel.convert_entire_string_to_html, "<h2>"
  end

  def test_convert_triple_hashtag_to_h3
    chisel = Chisel.new("### ")
    assert_equal chisel.convert_entire_string_to_html, "<h3>"
  end

  def test_convert_quad_hashtag_to_h4
    chisel = Chisel.new("#### ")
    assert_equal chisel.convert_entire_string_to_html, "<h4>"
  end

  def test_convert_penta_hashtag_to_h5
    chisel = Chisel.new("##### ")
    assert_equal chisel.convert_entire_string_to_html, "<h5>"
  end

  def test_convert_double_newline_to_p
    chisel = Chisel.new("\n\n")
    assert_equal chisel.convert_entire_string_to_html, "<p>"
  end

  def test_convert_double_newlines_to_p_with_ending_p
    chisel = Chisel.new("A cat went\n\nto the park")
    assert_equal chisel.convert_entire_string_to_html, "A cat went<p>to the park</p>"
  end


end
