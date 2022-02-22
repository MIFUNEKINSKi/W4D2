require_relative "Piece"
class King < Piece
  require Stepable
  def initialize(color,board, pos)
    super
  end

  def move_diffs
    moves("king")
  end
end