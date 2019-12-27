require_relative "util/trie.rb"

class TrieSearch
  def initialize(word_list_file_name)
    word_list = CSV.read(word_list_file_name).flatten

    @trie = Trie.new
    word_list.each do |word|
      @trie.add(word)
    end
  end

  def search(tiles)
    tile_array = tiles.split('')
    words = Set.new
    tile_array.permutation.each do |word_array|
      words = words + @trie.words_along_the_way(word_array)
    end
    return words
  end
end
