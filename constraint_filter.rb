class ConstraintFilter
  WILD_CARD_CHAR = "-"
  def initialize(word_list)
    @word_list = word_list
  end

  def filter(constraint_array)
    @word_list.select do |word|
      fits_constraint?(constraint_array, word)
    end
  end

  private

  # def fits_constraint?(constraint_array, word)
  #   possible_offsets = constraint_array.length - word.length
  #   #puts "possible_offsets: #{possible_offsets}"
  #   #puts "word: #{word}"
  #   #puts "constraint_array: #{constraint_array.to_s}"
  #   return false if possible_offsets < 0 #constraint.length < word.length

  #   (0..possible_offsets).each do |current_offset|
  #     front_padding = Array.new(current_offset, "*")
  #     rear_padding = Array.new(possible_offsets - current_offset, "*")
  #     padded_word_array = front_padding + word.split("") + rear_padding

  #     #puts "c: " + constraint_array.join
  #     #puts "w: " + padded_word_array.join

  #     constraint_array.each_with_index do |constraint_char, index|
  #       word_char = padded_word_array[index]

  #       if constraint_char != WILD_CARD_CHAR && constraint_char != word_char
  #         #puts "Miss-match on constraint char:" + constraint_char
  #         break
  #       elsif index == constraint_array.length - 1
  #         return true
  #       end
  #     end
  #   end

  #   return false
  # end

  def fits_constraint?(constraint_array, word)
    possible_offsets = constraint_array.length - word.length
    puts "possible_offsets: #{possible_offsets}"
    #puts "word: #{word}"
    #puts "constraint_array: #{constraint_array.to_s}"
    return false if possible_offsets < 0 #constraint.length < word.length

    (0..possible_offsets).each do |current_offset|
      front_padding = Array.new(current_offset, WILD_CARD_CHAR)
      rear_padding = Array.new(possible_offsets - current_offset, WILD_CARD_CHAR)
      padded_word_array = front_padding + word.split("") + rear_padding

      puts "c: " + constraint_array.join
      puts "w: " + padded_word_array.join

      uses_constraint_letters = false

      constraint_array.each_with_index do |constraint_char, index|
        word_char = padded_word_array[index]

        if constraint_char != WILD_CARD_CHAR && constraint_char == word_char
          uses_constraint_letters = true
        elsif constraint_char != word_char && constraint_char != WILD_CARD_CHAR && word_char != WILD_CARD_CHAR
          puts "Miss-match on constraint char:" + constraint_char
          break
        elsif index == constraint_array.length - 1
          return true if uses_constraint_letters
        end
      end
    end

    return false
  end
end
