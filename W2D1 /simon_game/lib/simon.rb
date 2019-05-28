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
      take_turn #no es necesario poner self
    # end
    # if game_over
    end
      game_over_message
      reset_game
    end
  end

  def take_turn
    self.show_sequence
    self.require_sequence

    unless game_over
      self.round_success_message
      @sequence_length += 1
    end
      
  end

  def show_sequence
    self.add_random_color
    puts "#{@seq}"
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
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end
