require_relative 'iterative_search.rb'
require_relative 'constraint_filter.rb'

@iterative_search = IterativeSearch.new("words.txt")

while true do
  puts "What tiles do you have? ('?' for blanks)"
  my_tiles = gets

  puts "What constraints? ('-' for blank spaces. E.g. '---s-'"
  constraint = gets.chomp

  puts "Possible matches:"
  puts "*****************"
  search_results = @iterative_search.search(my_tiles)
  search_results = ConstraintFilter.new(search_results).filter(constraint) if constraint.length > 0

  puts search_results.sort_by(&:length).reverse
  puts "*****************"
end
