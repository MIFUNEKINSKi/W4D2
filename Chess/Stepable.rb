
module Stepable

  def moves(dir)
    temp_x = pos[0] 
    temp_y = pos[1]

    if dir == "knight" 
      possible_moves = [
        [2,1],
        [2,-1],
        [1,2],
        [1,-2],
        [-2,1],
        [-2,-1],
        [-1,2],
        [-1,-2],
      ]
      return_arr = []
      possible_moves.each do |subb_arr|
        subb_arr[0] = dx
        subb_arr[1] = dy
        return_arr << [temp_x + dx, temp_y + dy] if valid_pos?([temp_x + dx, temp_y + dy)
      end 

    elsif dir == "king" 

      possible_moves = [
        [1,1]
        [1,0]
        [0,1]
        [-1,0]
        [0,-1]
        [-1,-1]
        [-1,1]
        [1,-1]
      ]
      return_arr = []
      possible_moves.each do |subb_arr|
        subb_arr[0] = dx
        subb_arr[1] = dy
        return_arr << [temp_x + dx, temp_y + dy] if valid_pos?([temp_x + dx, temp_y + dy)
      end
    end 
      return_arr
  end 
end 
