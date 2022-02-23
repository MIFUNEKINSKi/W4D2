require_relative "piece"
require_relative "board"
require_relative "Slidable"

class Queen < Piece
include Slidable
  def initialize(color,board,pos)
    super
    if @color == "white" 
      @symbol = " ♕"
    else 
      @symbol = " ♛"
    end
  end
   

  def move_dirs
    both = HORIZONTAL_DIRS+DIAGONAL_DIRS
    moves(both)
  end 

end 