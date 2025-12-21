#!/usr/bin/env ruby

# Board class is responsible for holding and displaying the game board
class Board
  attr_reader :cells

  def initialize
    @cells = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  # Prints the board in a 3x3 format
  def draw
    puts
    @cells.each_slice(3) do |row|
      puts "| #{row[0]} | #{row[1]} | #{row[2]} |"
      puts '-------------'
    end
    puts
  end

  # Updates a cell with the player's symbol if it's available
  def update(position, symbol)
    index = position - 1
    return false unless @cells[index].is_a?(Integer)

    @cells[index] = symbol
    true
  end

  # Checks if the board is completely filled
  def full?
    @cells.none? { |cell| cell.is_a?(Integer) }
  end
end

# Player class stores player information
class Player
  attr_reader :name, :symbol, :moves

  def initialize(name, symbol)
    @name = name
    @symbol = symbol
    @moves = []
  end

  # Stores the chosen move
  def add_move(position)
    @moves << position
  end
end

# Game class controls the game flow
class Game
  WINNING_COMBINATIONS = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9],
    [1, 4, 7],
    [2, 5, 8],
    [3, 6, 9],
    [1, 5, 9],
    [3, 5, 7]
  ]

  def initialize
    @board = Board.new
    @player1 = Player.new('Player 1', 'X')
    @player2 = Player.new('Player 2', 'O')
    @current_player = @player1
  end

  # Switches the current player
  def switch_player
    @current_player =
      @current_player == @player1 ? @player2 : @player1
  end

  # Checks if the current player has a winning combination
  def winner?
    WINNING_COMBINATIONS.any? do |combo|
      (combo - @current_player.moves).empty?
    end
  end

  # Main game loop
  def play
    puts 'Welcome to Tic Tac Toe!'

    loop do
      @board.draw
      puts "#{@current_player.name} (#{@current_player.symbol}), choose a position (1-9):"

      position = gets.to_i

      unless (1..9).include?(position)
        puts 'Invalid input. Choose a number between 1 and 9.'
        next
      end

      unless @board.update(position, @current_player.symbol)
        puts 'That position is already taken. Try again.'
        next
      end

      @current_player.add_move(position)

      if winner?
        @board.draw
        puts "#{@current_player.name} wins!"
        break
      end

      if @board.full?
        @board.draw
        puts "It's a draw!"
        break
      end

      switch_player
    end
  end
end

# Start the game
game = Game.new
game.play
