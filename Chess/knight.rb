require_relative "piece"
require_relative "board"
require_relative "Stepable"
class Knight < Piece
include Stepable
  def initialize(color,board, pos)
    super
  end

  def move_dirs
    moves(KNIGHT)
  end
end