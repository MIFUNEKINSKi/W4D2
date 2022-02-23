require_relative "pieces.rb"
require "byebug"
class Board
  # null_p = NullPiece.instance

  def initialize
    @grid = Array.new(8) {Array.new(8, NullPiece.instance)}
    place_blacks
    place_whites
  end

  attr_accessor :grid
  def [](pos)
    x,y = pos
    grid[x][y]
  end

  def place_blacks
    backline = [Rook, Knight, Bishop, Queen, King, Bishop, Knight, Rook]
    row = 7
    col = 0
    while col < 8 
      grid[row][col] = backline[col].new("black",self,[row,col])
      col +=1
    end
    row = 6
    col = 0
    while col < 8
      grid[row][col] = Pawn.new("black",self,[row,col])
      col+=1
    end
  end

  def place_whites
    backline = [Rook, Knight, Bishop, Queen, King, Bishop, Knight, Rook]
    row = 0
    col = 0
    while col < 8 
      grid[row][col] = backline[col].new("white",self,[row,col])
      col +=1
    end
    row = 1
    col = 0
    while col < 8
      grid[row][col] = Pawn.new("white",self,[row,col])
      col +=1
    end
  end

  def []=(pos,piece)
    x,y = pos
    grid[x][y] = piece
  end




  def valid_pos?(pos)
    return false if pos[0] < 0 || pos[0] > 7
    return false if pos[1] < 0 || pos[1] > 7
    return true if  self[pos] == NullPiece.instance
  
  end
      
    
  def move_piece(color,start_pos,end_pos)
    #debugger
    if self[start_pos] == NullPiece.instance
      raise "no piece exists here"
      return false
    elsif self[end_pos] != NullPiece.instance && self[end_pos].color == self[start_pos].color
      raise "this is your piece"
      return false
    elsif self[end_pos] != NullPiece.instance && self[end_pos].color != self[start_pos].color
      self[end_pos] = self[start_pos]
      self[start_pos]= NullPiece.instance
      self[end_pos].pos = end_pos
    else
      self[start_pos],self[end_pos] = self[end_pos],self[start_pos]
      self[end_pos].pos = end_pos
    end
    return true
  end

  def board_print
    # debugger
    grid.each do |row|
      p row 
    end 
  end 
 
end 
