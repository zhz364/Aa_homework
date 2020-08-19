class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    until @game_over
      take_turn
    end

    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence

    unless @game_over
      round_success_message
      @sequence_length += 1
    end
  end

  def show_sequence
    add_random_color
    @seq.each do |color|
      puts color
      sleep 0.75
      system("clear")
      sleep 0.25
    end
  end

  def require_sequence
    puts "input color"
    @seq.each do |color|
      input= gets.chomp
      if color != input
        @game_over = true
        break
      end
    end
  end 

  def add_random_color
    @seq << COLORS.sample
  end

  def round_success_message
    p "Nice"
  end

  def game_over_message
    p "GG"
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end

g = Simon.new
g.play