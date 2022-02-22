require_relative "piece.rb"
require "byebug"
class Board
  def initialize
    @grid = Array.new(8) {Array.new(8, nil)}
    # (0..1).each do |row|
    #   @grid[row].each.with_index do |el,col|
    #     @grid[row][col] = Piece.new()
    #   end 
    # end 
    # (6..7).each do |row|
    #   @grid[row].each.with_index do |ele,col|
    #     @grid[row][col] = Piece.new
    #   end 
    # end 
  end
  attr_accessor :grid
  def [](pos)
    x,y = pos
    grid[x][y]
  end

  def []=(pos,piece)
    x,y = pos
    grid[x][y] = piece
  end



  def move_piece(start_pos,end_pos)
    # debugger
    if self[start_pos] == nil
      raise "WRONG POSITION"
    elsif end_pos[0] > 7 || end_pos[0] < 0
      raise "WRONG POSITION"
    elsif end_pos[1] > 7 || end_pos[1] < 0
      raise "WRONG POSITION"
    else
      temp = self[start_pos]
      self[start_pos] = nil
      self[end_pos] = temp 
    end
  end

  def board_print
    # debugger
    grid.each do |row|
      p row 
    end 
  end 
 
end 
