require_relative "trie_node.rb"
require "set"

class Trie
  def initialize
    @children = {}
  end

  def add(word)
    word_array = word.split("")
    current_node = nil
    children = @children

    word_array.each do |char|
      if children[char].nil?
        children[char] = TrieNode.new
      end
      current_node = children[char]
      children = current_node.children
    end

    current_node.word = true
  end

  def contains?(word)
    word_array = word.split("")
    current_node = nil
    children = @children

    word_array.each do |char|
      if children[char].nil?
        creturn false
      end
      current_node = children[char]
      children = current_node.children
    end

    return current_node.word == true
  end

  def all
    to_process = []
    words = []

    @children.each do |char, node|
      to_process << [char, node]
    end

    while to_process.any? do
      current_chars, current_node = to_process.pop
      if current_node.word
        words << current_chars
      end

      current_node.children.each do |char, node|
        to_process << [current_chars + char, node]
      end
    end

    return words
  end
end
