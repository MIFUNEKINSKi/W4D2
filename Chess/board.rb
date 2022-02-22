require_relative "Pieces/piece.rb"
require_relative "Pieces/null_pieces.rb"
require "byebug"
class Board
  def initialize
    @grid = Array.new(8) {Array.new(8, nil)}
    (0..1).each do |row|
      @grid[row].each.with_index do |el,col|
        @grid[row][col] = Piece.new
      end 
    end 
    (6..7).each do |row|
      @grid[row].each.with_index do |ele,col|
        @grid[row][col] = Piece.new
      end 
    end 
  end
  attr_accessor :grid
  # def [](pos)
  #   x,y = pos
  #   grid[x][y]
  # end

  # def []=(piece,pos)
  #   x,y = pos
  #   grid[x][y] = piece
  # end

  def move_piece(start_pos,end_pos)
    # debugger
    if start_pos == nil && end_pos[0] > 7 && end_pos[0] < 0
      raise "You can't place there"
    else
      grid[start_pos[0]][start_pos[1]] != nil
      temp = grid[start_pos[0]][start_pos[1]]
      grid[start_pos[0]][start_pos[1]] = nil
      grid[end_pos[0]][end_pos[1]] = temp
     
    end
  end

  def board_print
    # debugger
    grid.each do |row|
      p row 
    end 
  end 
 
end 

a = Board.new
a.move_piece([0,0],[5,5])
a.board_print