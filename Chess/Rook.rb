require_relative "piece"
require_relative "board"
require_relative "Slidable"
require "byebug"

class Rook < Piece
include Slidable

  def initialize(color,board,pos)
    super 
    if @color == "white"
      @symbol = " ♖"
    else
      @symbol = " ♜"
    end
  end 
  
  def move_dirs
    moves(HORIZONTAL_DIRS)
  end


end 