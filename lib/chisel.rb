class Chisel

  attr_reader :input

  def initialize(input)
    @input = input
  end

  def conversion_key
    conversion_key = {
      "##### " => "<h5>",
      "#### " => "<h4>",
      "### " => "<h3>",
      "## " => "<h2>",
      "# " => "<h1>",
      " #" => "</h1>",
      "\n\n" => "<p>"
    }
  end

  def convert_entire_string_to_html
    conversion_key.each do |key, value|
      if input.include?(key)
        @input.gsub!(key, value)
      end
    end
    @input
  end

end
