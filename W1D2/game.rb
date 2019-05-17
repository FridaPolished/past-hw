require_relative "board"
require_relative "card"
require "byebug"

class Game
  def initialize
    @board = Board.new
    @previous_position = []
  end

  def play
    @board.populate

    #debugger
    until @board.won?
      @board.render
      puts "Enter a position [row,col]: "
      until !@board[user_position].revealed?
      user_position = gets.chomp
      user_position = [user_position[1].to_i, user_position[3].to_i]
      raise "Error! Enter another position"
          
        end
      self.make_guess(user_position)
    end

  end

  def make_guess(pos)
    @board.reveal(pos)
    @board.render
    
    if @previous_position.empty? 
      @previous_position << pos
    else
      unless @board.reveal(pos) == @board.reveal(@previous_position[0])
        sleep(4)
        @board[pos].hide
        @board[@previous_position[0]].hide
      end 
      @previous_position = []
    end

  end


end

game = Game.new
game.play