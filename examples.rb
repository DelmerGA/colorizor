require_relative("./main.rb")

puts "blue text".blue + " plain text"
puts "plain text" + "  blue text".blue
puts "some text interpolated #{'blue text'.blue}"
puts "green".blue.red.green
puts "green text with  bg_blue".bg_blue + " and regular text"
puts  "#{'some cyan bg'.red}".bg_red.bg_cyan
