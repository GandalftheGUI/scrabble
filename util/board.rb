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
      row.each_with_index do |type, row_index|
        board.grid[[column_index, row_index]] = Square.new(**MULTIPLIERS[(type || "").gsub(/\s+/, "") ])
      end
    end

    return board
  end

  def get_all_hoizontal_words
  end

  def get_hoizontal_word(col, row)
    current_col = col


    while current_col >= 0 && !get_square(current_col, row).letter.nil?
      current_col -= 1
    end
    current_col += 1

    word_array = []
    while current_col <= @x_limit && !get_square(current_col, row).letter.nil?
      word_array << get_square(current_col, row).letter
      current_col += 1
    end
    return word_array
  end

  def get_hoizontal_letters(row)
    current_col = 0
    current_row = row
    letters = []
    while current_col <= @x_limit
      letter = get_square(current_col, current_row).letter
      letters << letter unless letter.nil?
      current_col += 1
    end
    return letters
  end

  def get_row_info(row)
    current_col = 0
    current_row = row
    constraint_array = []
    letters = []
    while current_col <= @x_limit
      letter = get_square(current_col, current_row).letter

      if letter.nil?
        constraint_array <<  "-"
      else
        constraint_array << letter
        letters << letter
      end

      current_col += 1
    end
    return {constraint_array: constraint_array, letters: letters}
  end

  def print
    (0..@y_limit).each do |y|
      row = []
      (0..@x_limit).each do |x|
        row << grid[[x,y]].to_s
      end
      puts y.to_s.rjust(2, " ") + " " + row.join("|")
    end
    puts "   --------------------------------------------"
  end

  def place_tile(letter, col, row)
    get_square(col, row).letter = letter.downcase
  end

  def get_square(col, row)
    @grid[[col, row]]
  end
end
