module Slidable
    HORIZONTAL_DIRS = 
    [
      [1,0],
      [0,1],
      [-1,0],
      [0,-1]
    ]

    DIAGONAL_DIRS = 
    [
      [1,1],
      [-1,-1],
      [1,-1],
      [-1,1]
    ]

  def moves(dir)
    arr = []
    if dir == "horizontal"
      HORIZONTAL_DIRS.each do |subb_arr|
        subb_arr[0] = dx
        subb_arr[1] = dy
        arr += grow_unblocked_moves_in_dir(dx,dy)
      end 

    elsif dir == "diagonal"
       DIAGONAL_DIRS.each do |subb_arr|
        subb_arr[0] = dx
        subb_arr[1] = dy
        arr += grow_unblocked_moves_in_dir(dx,dy)
      end 
      
    elsif dir == "both" 
      both = DIAGONAL_DIRS + HORIZONTAL_DIRS
      both.each do |subb_arr|
          dx =  subb_arr[0]
          dy = subb_arr[1]
          arr += grow_unblocked_moves_in_dir(dx,dy)
        end 
    end 
    
    arr
  end
  # call method move_dirs
  # either or both horizontal dirs and diagonal dirs

  # example: rook move_dirs returns horizontal dirs
  # this is an array that we can iterate and have access to each direction a rook can move
  # pass in first direction[1,0] into grow_unblocked_moves_in_dir(dx,dy)

    



  private 
  def grow_unblocked_moves_in_dir(dx,dy)
    moves = []
    temp_x = pos[0] + dx
    temp_y = pos[1] + dy
    while board.valid_pos([temp_x,temp_y])
      moves << [temp_x,temp_y]
      temp_x = pos[0] + dx
      temp_y = pos[1] + dy
    end 
    return moves
  end 


end 
