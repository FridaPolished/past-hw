class Game

  def initialize(p1, p2)
    @p1 = Player.new
    @p2 = Player.new
    @fragment = ""
    @dictionary = {
      "train" => "train",
      "computer" => "computer",
      "whiteboard" => "whiteboard",
      "pain" => "pain",
      "trunk" => "trunk"
    }
    @moves = [@p1]
    @current = @moves[0]
    @previous = nil
    @idx = 0
  end

  def current_player
    @moves[-1]
  end

  def previous_player
    raise "no previous player" if @moves.length == 1

    @moves[-2]
  end

  def next_player!
    if @moves[-1] == @p1
      @current = @p2
      @previous = @p1
      @moves << @p2
    else 
      @current = @p1
      @previous = @p2
      @move << @p1
    end
  end

  def take_turn(player)
    puts "Please enter a character"
    input = gets.chomp

    if valid_play?(input)
      @dictionary.each do |k, v|
        if v[idx] == input 
          @fragment += input
          idx += 1
          self.next_player!
        end
      end
    else 
      raise "Invalid move"
    end
  end

  def valid_play?(string)
    
  end

end