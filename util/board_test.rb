require_relative "board.rb"

b = Board.load_wwf_board
b.print
b.place_tile("a", 0, 0)
b.place_tile("b", 14, 14)
b.print
