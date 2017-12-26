# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]
]

def empty?(board)
  if board.all? { |e| e == "" || e == " " }
    return true
  end
end

def won?(board)
  if empty?(board)
    return false

  elsif draw?(board)
    return false

  else
    WIN_COMBINATIONS.each do |win_combination|
      win_combination.each do |win_index|
        win_index_1 = win_combination[0]
        win_index_2 = win_combination[1]
        win_index_3 = win_combination[2]

        position_1 = board[win_index_1]
        position_2 = board[win_index_2]
        position_3 = board[win_index_3]

        if position_1 == "X" && position_2 == "X" && position_3 == "X"
          win_index = [win_index_1, win_index_2, win_index_3]
          return win_index
        elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
          win_index = [win_index_1, win_index_2, win_index_3]
          return win_index
        end
      end
    end

  end
end

def full?(board)
  if empty?(board)
    return false

  elsif draw?(board)
    return true

  end
end

def draw?(board)
  if full?(board) == true
    
  else
    false
  end
end

def over?(board)
  if draw?(board)
    return true
  elsif won?(board) != false
    return true
  elsif (draw?(board) && winner(board) == nil) || !full?(board)
    return false
  end
end

def winner(board)
  win_index = won?(board)
  if board[win_index[0]] == "X"
    return "X"
  elsif board[win_index[0]] == "O"
    return "O"
  elsif draw?(board)
    return nil
  end
end
