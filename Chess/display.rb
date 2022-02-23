require "colorize"
require_relative "cursor"

class Display
  def initialize(board)
    @cursor = Cursor.new([[0,0],board)
    @board = board
  end

  def render
    @board.board_print
  end
  
end