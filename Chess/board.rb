require_relative "pieces.rb"
require "byebug"
require "colorize"


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

  def dup
    new_board = Board.new
    new_board.grid = @grid.map{ |row| row.map {|el| el}}
    return new_board

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
    grid.each.with_index do |row, i|
      row.each.with_index do |ele,j|
        if (i.even? && j.even?) || (i.odd? && j.odd?)
          print @grid[i][j].to_s.colorize(:color => :yellow, :background => :red)+" ".colorize( :background => :red)
        else
          print @grid[i][j].to_s.colorize(:color => :yellow, :background => :orange)+" ".colorize( :background => :orange)
        end
      end
      print "\n"
    end 
  end 

  def king_pos(color)
    @grid.each do |row|
      row.each do |piece|
        return piece.pos if piece.instance_of?(King) && piece.color == color
      end 
    end 
  end 

 

  def enemy_pieces(color)
    final = [] 
    @grid.each do |row|
     final += row.select {|ele| ele.color == color}
    end 
    final
  end 


   def in_check?(arr,our_color)
    arr.each do |piece|
      debugger
      return true if piece.move_dirs.include?(king_pos(our_color))
    end 
    false
  end 

  def are_we_in_check?(color)
    if color == "white"
      return in_check?(enemy_pieces("black"),color)
    else 
      return in_check?(enemy_pieces("white"),color)
    end 
  end 


 
end 
