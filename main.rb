require_relative 'iterative_search.rb'
require_relative 'trie_search.rb'
require_relative 'constraint_filter.rb'


@iterative_search = IterativeSearch.new("words.txt")
@trie_search = TrieSearch.new("words.txt")

my_tiles = ""
while true do
  puts "What tiles do you have? ('?' for blanks, 'enter' for previous input)"
  user_input = gets.chomp
  if user_input.length > 0
    my_tiles = user_input
  else
    puts my_tiles
  end

  puts "What constraints? ('-' for blank spaces. E.g. '---s-')"
  constraint = gets.chomp
  constraint_tiles = constraint.split("").select{|char| char != "-"}

  search_results = @iterative_search.search(my_tiles + constraint_tiles.join)
  search_results = ConstraintFilter.new(search_results).filter(constraint) if constraint.length > 0

  puts "Iterative Possible matches (#{search_results.count}):"
  puts "*****************"
  puts search_results.sort_by(&:length).reverse
  puts "*****************"




  # search_results = @trie_search.search(my_tiles)
  # search_results = ConstraintFilter.new(search_results).filter(constraint) if constraint.length > 0

  # puts "Trie Possible matches (#{search_results.count}):"
  # puts "*****************"
  # puts search_results.sort_by(&:length).reverse
  # puts "*****************"
end
