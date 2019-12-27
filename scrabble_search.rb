require_relative 'iterative_search.rb'
require_relative 'trie_search.rb'
require_relative 'util/board.rb'
require_relative 'constraint_filter.rb'
@iterative_search = IterativeSearch.new("words.txt")

board = Board.load_wwf_board

board.place_tile("c", 6, 7)
board.place_tile("a", 7, 7)
board.place_tile("t", 8, 7)
board.print

row_info = board.get_row_info(7)
row_letters = row_info[:letters]
row_constraint_array = row_info[:constraint_array]

puts row_letters.to_s

puts "What letters do you have? ('?' for blanks)"
my_letters = gets.chomp.gsub(/\s+/, "")

all_letters = my_letters + row_letters.join

search_results = @iterative_search.search(all_letters)

puts ConstraintFilter.new(search_results).filter(row_constraint_array)
