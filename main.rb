class String

  def self.colors
    @@colors
  end

  def colors
    @@colors
  end
  
  @@colors = [
                :black,
                :red,
                :green,
                :brown,
                :blue,
                :magenta,
                :cyan,
                :gray
              ]

  @@color_and_codes = Hash.new

  @@colors.each_with_index  do |color, index|
     @@color_and_codes[color] = index + 30
  end
 
  class ColorString
 
    attr_reader :color

    def initialize(val, color_code, color)
      @color = color
      @color_code = color_code
      @val = val
    end
 
    def to_s
      colorize()
    end

    def +(other)
      if other.instance_of?(String)
        colorize + other
      elsif other.instance_of?(ColorString)
        colorize + other.to_s
      end
    end

    def coerce(other)
      [self, other]
    end

    def method_missing(m, *args, &block)
      unless String.colors.include?(m)
        colorize().send(m, *args, &block)
      else
        @val.send(m)
      end
    end

  private

    def colorize()
      "\e[#{@color_code}m#{@val}\e[0m"
    end

  end

  @@color_and_codes.each do |color, code|
    define_method(color) do
      ColorString.new(self, code, color)
    end
  end

end


p "blah".blue
puts "blah".red.green + " blah ".blue
