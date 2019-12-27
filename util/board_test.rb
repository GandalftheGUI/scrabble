require_relative "board.rb"

b = Board.load_wwf_board
b.print
b.place_tile("a", 0, 0)
b.place_tile("b", 14, 14)
b.print

b.place_tile("c", 6, 7)
b.place_tile("a", 7, 7)
b.place_tile("t", 8, 7)
b.print

puts "should equal CAT: #{b.get_hoizontal_word(7,7).join}"
puts "should equal CAT: #{b.get_hoizontal_word(6,7).join}"
puts "should equal CAT: #{b.get_hoizontal_word(8,7).join}"


b.place_tile("b", 0, 6)
b.place_tile("a", 1, 6)
b.place_tile("t", 2, 6)
b.print

puts "should equal BAT: #{b.get_hoizontal_word(0,6).join}"
puts "should equal BAT: #{b.get_hoizontal_word(1,6).join}"
puts "should equal BAT: #{b.get_hoizontal_word(2,6).join}"


b.place_tile("x", 13, 5)
b.place_tile("i", 14, 5)
b.print

puts "should equal XI: #{b.get_hoizontal_word(13,5).join}"
puts "should equal XI: #{b.get_hoizontal_word(14,5).join}"

