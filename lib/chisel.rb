class Chisel

  attr_reader :input

  def initialize(input)
    @input = input
  end

  def conversion_key
    conversion_key = {
      "#" => "<h1>",
      "##" => "<h2>",
      "###" => "<h3>",
      "\n\n" => "<p>"
    }
  end

  def convert
    convert_single_hashtag_to_h1
    convert_double_hashtag_to_h2
  end

  def convert_single_hashtag_to_h1
    if @input.include?("#")
      output = @input.gsub("#", "<h1>")
    end
    output
  end

  def convert_double_hashtag_to_h2
    if @input.include?("##")
      output = @input.gsub("##", "<h2>")
    end
    output
  end

  def convert_entire_string_to_html
    output_string = ""
    @input.each_char do |char|
      if conversion_key.key?(char)
        output_string += conversion_key[char]
      else
        output_string += char
      end
    end
    output_string
  end

end
