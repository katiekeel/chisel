class Chisel

  attr_reader :input

  def initialize(input)
    @input = input
  end

  def conversion_key
    conversion_key = {

    }
  end

  def convert_single_hashtag_to_h1
    if @input.include?("#")
      @input.gsub!("#", "<h1>")
    end
  end

end
