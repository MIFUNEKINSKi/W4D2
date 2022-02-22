require_relative "Piece"
class Knight < Piece
  require Stepable
  def initialize(color,board, pos)
    super
  end

  def move_diffs
    moves("knight")
  end
end