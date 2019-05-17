require_relative "card.rb"
require "byebug"

class Board

  def initialize
    @grid = Array.new(4) { Array.new(4) }
  end

  def populate
    # (tiles / 2) pairs of cards
    # indices are numbers between 0 to length of grid
    # debugger

    alphabet = ("a".."z").to_a
    num_cards = @grid.length ** 2
    
    while num_cards > 0
      alphabet[0...(@grid.length ** 2) / 2].each do |letter|
        2.times do
          place_card(letter)
          num_cards -= 1
        end
      end
    end
  end

  def place_card(letter)
    taken = false
    
    until taken # while !taken
      column = rand(@grid.length)
      row = rand(@grid.length)

      if @grid[row][column].nil?
        @grid[row][column] = Card.new(letter) 
        taken = true
      end
    end
  end

  def render
    system("clear")

    puts "  0 1 2 3"
    
    @grid.each_with_index do |row, row_idx|
      # debugger
      print "#{row_idx} "
      print_row = row.map do |card|
        if card.revealed?
          card.to_s
        else
          " "
        end
      end
      
      puts print_row.join(" ")
    end
  end

  def won?
    @grid.all? do |row|
      row.all? do |card|
        card.revealed?
      end
    end
  end

  def reveal(guessed_pos)
    card = self[guessed_pos]
    card.reveal if !card.revealed?
    card.display
  end

  # array[]
  # array[] =

  def [](guessed_pos)
    row, col = guessed_pos
    @grid[row][col]
  end

  def []=(guessed_pos, value)
    row, col = guessed_pos
    @grid[row][col] = value
  end

end

