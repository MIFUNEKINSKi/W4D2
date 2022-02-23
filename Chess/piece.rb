require_relative "board"
class Piece
attr_reader :color, :board, :pos
  def initialize(color,board, pos)
    @color = color
    @board = board
    @pos = pos
    @symbol = "x"
  end 

  def to_s
    return @symbol
  end

  


end 
