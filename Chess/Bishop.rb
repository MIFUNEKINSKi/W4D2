require_relative "piece"
require_relative "board"

class Bishop < Piece
include Slidable
    def initialize(color,board,pos)
    super 
  end 

  def move_dirs
    moves("diagonal")
  end 

end 