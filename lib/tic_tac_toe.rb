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

  def position_taken?
    @board[input_to_index] == " " ? false : true
  end

  def valid_move?(position)
    (0..8).include?(position) && position_taken == false ? true : false
  end

  def turn
    index = nil
    until valid_move?(index)
      puts "Please pick a position on the board between 1 and 9 to play your token."
      input = gets.chomp
      index = input_to_index(input)
      if valid_move?(index)
        move(index, token)
        display_board
      else
        puts "Please make a different move."
      end
    end
  end

  def turn_count
    @board.select {|pos| pos != " "}.length
  end

  def current_player
  end

  def won?
  end

  def full?
  end

  def draw?
  end

  def over?
  end

  def winner
  end

  def play


end
