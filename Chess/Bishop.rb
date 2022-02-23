require_relative "piece"
require_relative "board"
require_relative "Slidable"

class Bishop < Piece
include Slidable
    def initialize(color,board,pos)
    super 
  end 

  def move_dirs
    moves(DIAGONAL_DIRS)
  end 

end 