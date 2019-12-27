require_relative "util/trie.rb"

class TrieSearch
  def initialize(word_list_file_name)
    word_list = CSV.read(word_list_file_name).flatten

    @trie = Trie.new
    word_list.each do |word|
      @trie.add_word(word)
    end
  end

  def search(tiles)
    tile_array = tiles.split('')

  end
end
