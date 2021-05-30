require 'pry'

class TicTacToe

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,4,8],
    [6,4,2],
    [0,3,6],
    [1,4,7],
    [2,5,8]
  ]

  THREE_IN_A_ROW = [
    ['X', 'X', 'X'],
    ['O', 'O', 'O']
  ]

  def initialize
    @board = Array.new(9, " ")
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    input.to_i - 1
  end

  def move(i, token = 'X')
    @board[i] = token
  end

  def position_taken?(index)
    @board[index] == " " ? false : true
  end

  def valid_move?(pos)
    (0..8).include?(pos) && position_taken?(pos) == false ? true : false
  end

  def turn
    puts "Please pick a position on the board between 1 and 9 to play your token."
    input = gets.chomp
    index = input_to_index(input)
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      puts "Please make a different move."
      self.turn
    end

  end

  def turn_count
    @board.select {|pos| pos != " "}.length
  end

  def current_player
    current_turn = turn_count + 1
    current_turn % 2 != 0 ? 'X' : 'O'
  end

  def won?
    WIN_COMBINATIONS.find do |win_combo|
      THREE_IN_A_ROW.include?(win_combo.map {|i| @board[i]})
    end
  end

  def full?
    !@board.any? {|pos| pos == " "}
  end

  def draw?
    full? && !won? ? true : false
  end

  def over?
    won? || draw?
  end

  def winner
    @board[won?.first] if won?
  end

  def play
    until over?
      turn
    end

    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end


end
