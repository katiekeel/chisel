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
      line = check_for_ending_tag(line)
      output += line
    end
    output
  end

  def check_for_ending_tag(line)
      conversion_key.each_value do |value|
        if line.include?(value)
          value = value.gsub("<", "</") unless value == "<p>"
          line = line + "#{value}" unless line.end_with?(value)
        end
      end
      line = line + "</p>" if line.include?("<p>") == false && line.include?("<h") == false
      line
  end




end
