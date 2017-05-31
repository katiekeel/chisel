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

  def test_convert_single_hashtag_to_markdown
    chisel = Chisel.new("#")
    assert_equal chisel.convert_single_hashtag_to_h1, "<h1>"
  end    

end
