class TicTacToe
  
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5]  # Middle row
    [6,7,8], # bottom_row 
    [0,3,6], # left_column 
    [1,4,7], # center_column 
    [2,5,8], # right_column 
    [0,4,8], # left_diagonal 
    [6,4,2] # right_diagonal 
    ]
  
  def input_to_index(user_input)
    user_input = gets.chomp
    user_input.to_i -1 
  end 
  
  def move(index, current_player)
      @board[index] = current_player    
  end 
 
  def position_taken?(board, index)
    if (board[index] == " ") || (board[index] == "") || (board[index] == nil)
      return false 
    else
      return true
    end
  end 
  
  def valid_move?(board, index)
    if index.between?(0,8) && !position_taken?(board, index)
      return true
    else 
      return false
    end 
  end 
  
  def turn
    puts "Please enter 1-9"
    user_input = gets.chomp
    index = input_to_index (user_input)
    if valid_move? (board, index)
      move(board, index, current_player(board))
      turn(board)
    else 
      puts "Current entry is taken, please chose another entry"
    end 
    display_board(board)
  end 
  
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end
 
  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end
 
  def won?(board)
    WIN_COMBINATIONS.each do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]
      position_1 = board[win_index_1] # value of board at win_index_1
      position_2 = board[win_index_2] # value of board at win_index_2
      position_3 = board[win_index_3] # value of board at win_index_3
      position_1 == position_2 && position_2 == position_3 && position_taken?(board, win_index_1)
    end
  end
 
  def full?(board)
    board.all? {|i| i=="X" || i== "O"}
  end 
  
  def draw?(board)
    if !won?(board) && full?(board)
      return true
    elsif !won?(board) && !full?(board)
      return false
    else won?(board)
      return false
    end
  end
  
  def over?(board)
    if draw?(board) || won?(board) || full?(board)
      return true
    end
  end
 
  def winner(board)
    if won?(board)
      return board[won?(board)[0]]
    end
  end
  
end