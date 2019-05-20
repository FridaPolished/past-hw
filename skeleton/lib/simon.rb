class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @seq = []
    @game_over = false
  end

  def play
    until game_over
      self.take_turn
    end
    if game_over
      self.game_over_message
      self.reset_game
    end
  end

  def take_turn
    if !game_over
      self.show_sequence
      @sequence_length += 1
      self.require_sequence
      self.round_success_message
    end
      
  end

  def show_sequence
    self.add_random_color
    puts "#{@sequence}"
  end

  def require_sequence
      puts "Write the color of the sequence: "
      user_input = gets.chomp

      i = 0
      while i < @sequence_length 
        if user_input != @seq[i] 
          @game_over = true
          self.game_over_message
        end
        i += 1
      end
  end

  def add_random_color
    @seq << COLORS.sample
  end

  def round_success_message
   puts "Good job!"
  end

  def game_over_message
    puts "Game over"
  end

  def reset_game
    @game_over = false
    @seq = []
    @sequence_length = 1
  end
end
