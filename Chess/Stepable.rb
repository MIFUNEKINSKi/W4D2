
module Stepable
  KNIGHT = [
        [2,1],
        [2,-1],
        [1,2],
        [1,-2],
        [-2,1],
        [-2,-1],
        [-1,2],
        [-1,-2]
      ]
  KING = [
        [1,1],
        [1,0],
        [0,1],
        [-1,0],
        [0,-1],
        [-1,-1],
        [-1,1],
        [1,-1]
      ]
  def moves(arr)
    temp_x = pos[0] 
    temp_y = pos[1]
    return_arr = []
    arr.each do |subb_arr|
      dx = subb_arr[0]
      dy = subb_arr[1]
      return_arr << [temp_x + dx, temp_y + dy] if board.valid_pos?([temp_x + dx, temp_y + dy])
    end 
    return_arr
  end

end 
