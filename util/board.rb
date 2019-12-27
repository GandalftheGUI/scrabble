require "csv"
require_relative "square.rb"
require "set"

class Board
  TRIPLE_WORD = "TW"
  DOUBLE_WORD = "DW"
  TRIPPLE_LETTER = "TL"
  DOULBE_LETTER = "DL"

  MULTIPLIERS = {
    TRIPLE_WORD => {word_multiplier: 3},
    DOUBLE_WORD => {word_multiplier: 2},
    TRIPPLE_LETTER => {letter_multiplier: 3},
    DOULBE_LETTER => {letter_multiplier: 2},
    "" => {}
  }

  attr_accessor :grid
  attr_reader :x_limit, :y_limit

  def initialize(x_size = 15, y_size = 15)
    @x_limit = x_size - 1
    @y_limit = y_size - 1
    @grid = {}
  end

  def self.load_wwf_board
    board_array = CSV.read(File.dirname(__FILE__) + "/boards/wwf.txt")
    board = self.new(board_array.first.length, board_array.length)
    board_array.each_with_index do |row, column_index|
      row.each_with_index do |value, row_index|
        puts "v: '#{value}'"
        board.grid[[column_index, row_index]] = Square.new(**MULTIPLIERS[(value || "").gsub(/\s+/, "") ])
      end
    end

    return board
  end

  def get(col, row)
    visited = Set.new
    visited << [col, row]
    @grid[[col,row]]
  end

  def print
    (0..@y_limit).each do |y|
      row = []
      (0..@x_limit).each do |x|
        row << grid[[x,y]].to_s
      end
      puts row.join("|")
    end
    puts "-" * (@x_limit * 3 + 2)
  end

  def place_tile(letter, col, row)
    get_square(col, row).value = letter.upcase
  end

  def get_square(col, row)
    @grid[[col, row]]
  end
end
