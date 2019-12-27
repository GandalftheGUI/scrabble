require 'csv'

class IterativeSearch
  def initialize(word_list_file_name)
    @word_list = CSV.read(word_list_file_name).flatten
  end

  def search(tiles)
    tile_array = tiles.split('')
    tile_hash = Hash.new(0)
    tile_array.each do |char|
      tile_hash[char] += 1
    end

    search_results = @word_list.select do |word|
      can_make?(tile_hash, word)
    end

    return search_results
  end

  private

  def can_make?(tile_hash, candidate_word)
    candidate_word_array = candidate_word.split('')
    candidate_word_hash = Hash.new(0)
    candidate_word_array.each do |char|
      candidate_word_hash[char] += 1
    end

    off_by_allowance = tile_hash["?"]

    candidate_word_hash.each do |char, count|
      #if you need 'aa' and have 'aaa' left_over_tile_count = 1 aka no problem
      #if you need 'aaa' and have 'aa' left_over_tile_count = -1 aka there is a problem
      left_over_tile_count = tile_hash[char] - count
      off_by_allowance += left_over_tile_count if left_over_tile_count < 0
      return false if off_by_allowance < 0
    end

    return true
  end
end
