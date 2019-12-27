require "set"

class TrieNode
  attr_reader   :children
  attr_accessor :word
  def initialize
    @word = false
    @children = {}
  end
end


