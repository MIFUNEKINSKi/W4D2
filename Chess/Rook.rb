require_relative "piece"
require_relative "board"

class Rook < Piece
include Slidable

  def initialize(color,board,pos)
    super 
  end 
  
  def move_dirs
    moves("horizontal")
  end 

end 