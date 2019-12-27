class Square
  attr_accessor :value
  attr_reader :word_multiplier, :letter_multiplier

  def initialize(word_multiplier: 1, letter_multiplier: 1)
    @word_multiplier = word_multiplier
    @letter_multiplier = letter_multiplier
  end

  def occupied?
    !value.nil?
  end

  def to_s
    if word_multiplier > 1
      word_multiplier + "W"
    elsif letter_multiplier > 1
      letter_multiplier + "L"
    else
      "  "
    end
  end
end
