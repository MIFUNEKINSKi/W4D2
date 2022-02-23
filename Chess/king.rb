require_relative "piece"
require_relative "board"
require_relative "Stepable"
class King < Piece
include Stepable
  def initialize(color,board, pos)
    super
    if @color == "white"
      @symbol = " ♔"
    else
      @symbol = " ♚"
    end
  end
  attr_reader :symbol
  def move_diffs
    moves(KING)
  end
end