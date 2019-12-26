require_relative "util/trie.rb"

class TrieSearch
  def initialize(word_list_file_name)
    @word_list = CSV.read(word_list_file_name).flatten
  end
end
