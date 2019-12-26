require_relative "trie_node.rb"
require "set"

class Trie
  def initialize
    @root = {}
  end

  def add_word(word)
    word_array = word.split("")
    current_node = root[char]

    word_array.each do |char|
      if current_node.nil?
        current_node = TrieNode.new
      end
      current_node = current_node[char]
    end

    current_node.word = true
  end

  def is_word?(word)
    word_array = word.split("")
    current_node = root[char]

    word_array.each do |char|
      if current_node.nil?
        return false
      end
      current_node = current_node[char]
    end

    return current_node.word == true
  end

  def all_words
    to_process = []
    words = []

    @root.each do |char, node|
      to_process << [char, node]
    end

    while to_process.any? do
      current_node, current_chars = to_process.pop
      if current_node.word
        words << current_chars
      end

      current_node.children.each do |char, node|
        to_process << [current_chars + char, node]
      end
    end
  end
end
