require_relative "piece"
require_relative "board"

class Pawn < Piece
  def initialize(color,board,pos)
    super 
  end

  def moves

  end

  private 
  def at_start_row?
    pos[0] == 1 || pos[0] == 6
  end

  def forward_dir(color)
    return 1 if color == "white"
    return -1 if color == "black"
  end

  def forward_steps
    
  end

end 