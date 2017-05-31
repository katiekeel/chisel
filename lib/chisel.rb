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
    output = ""
    @input.each_line("\n\n") do |line|
      conversion_key.each do |key, value|
        if line.include?(key)
          line.gsub!(key, value)
        end
      end
      line = check_for_ending_p_tag(line)
      output += line
    end
    output
  end

  def check_for_ending_p_tag(line)
    if line.include?("\n\n") == false && line.include?("<h") == false && line.end_with?("<p>") == false
      line = line + "</p>"
    end
    line
  end


end
