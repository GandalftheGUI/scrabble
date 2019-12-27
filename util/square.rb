class Square
  attr_accessor :letter
  attr_reader :word_multiplier, :letter_multiplier

  def initialize(word_multiplier: 1, letter_multiplier: 1)
    @word_multiplier = word_multiplier
    @letter_multiplier = letter_multiplier
  end

  def occupied?
    !letter.nil?
  end

  def to_s
    if letter
      highlight "#{letter.upcase} "
    elsif @word_multiplier == 3
      purple "tw"
    elsif @letter_multiplier == 3
      green "tl"
    elsif @word_multiplier == 2
      red "dw"
    elsif @letter_multiplier == 2
      blue "dl"
    else
      "  "
    end
  end

  private

  def colorize(text, color_code)
    "#{color_code}#{text}\e[0m"
  end

  def highlight(text)
    "\e[30m\e[43m#{text}\e[0m\e[0m"
  end

  def cyan(text); colorize(text, "\e[36m"); end
  def red(text); colorize(text, "\e[31m"); end
  def brown(text); colorize(text, "\e[33m"); end
  def green(text); colorize(text, "\e[32m"); end
  def blue(text); colorize(text, "\e[34m"); end
  def purple(text); colorize(text, "\e[35m"); end
end
