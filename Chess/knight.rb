require_relative "piece"
require_relative "board"
require_relative "Stepable"
class Knight < Piece
include Stepable
  def initialize(color,board, pos)
    super
    if @color == "white"
      @symbol = " ♘"
    else
      @symbol = " ♞"
    end
  end

  def move_dirs
    moves(KNIGHT)
  end
end