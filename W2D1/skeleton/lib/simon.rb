class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize()
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play

    until game_over
      take_turn
    end
    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    input = require_sequence
    if input == parse_seq
      @sequence_length += 1
      round_success_message
    else
      @game_over = true
    end
  end

  def show_sequence
    add_random_color
    @seq.each do |color|
      p "#{color}"
      sleep(1)
      system('clr')
    end
  end

  def require_sequence
    puts "Input sequence"
    input = gets.chomp
  end

  def add_random_color
    @seq << COLORS.sample
  end

  def round_success_message
    puts "Correct!"
  end

  def game_over_message
    puts "Game over!"
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def parse_seq
    @seq.map { |color| color[0] }.join("")
  end

end
