require_relative "trie.rb"

t = Trie.new
t.add("a")

t.add("cheese")
t.add("cat")
t.add("cataract")
t.add("caterer")

t.add("dog")
t.add("do")

all_words = t.all

puts all_words.to_s

puts all_words.map { |w| t.contains?(w) }
puts "Should be false: #{t.contains? "d"}"
puts "Should be true: #{t.contains? "do"}"
