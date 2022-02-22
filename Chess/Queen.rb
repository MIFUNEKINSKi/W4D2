require_relative "piece"
require_relative "board"

class Queen < Piece
include Slidable
  def initialize(color,board,pos)
      super 
    end 

  def move_dirs
    moves("both")
  end 

end 