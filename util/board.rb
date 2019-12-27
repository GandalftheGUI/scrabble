require "csv"
require_relative "square.rb"

class Board
  TRIPLE_WORD = "TW"
  DOUBLE_WORD = "DW"
  TRIPPLE_LETTER = "TW"
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
        board.grid[[column_index, row_index]] = Square.new(*MULTIPLIERS[value.chomp])
      end
    end
  end

  def print
    (0..@y_limit).each do |y|
      row = []
      (0..@x_limit).each do |x|
        row << grid[[x,y]].to_s
      end
      puts row.join("|")
    end
  end
end
