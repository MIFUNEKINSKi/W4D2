require_relative "piece"
require_relative "board"


class Pawn < Piece
  def initialize(color,board,pos)
    super 
  end

  def moves
    valid_moves = []
    if at_start_row? 
      arr = [
        [pos[0]+1*forward_dir(@color),pos[1]], #move forward once
        [pos[0]+2*forward_dir(@color),pos[1]], #move forward twice
        # [],#move left diagonal
        # []#move right diagonal
      ]
      arr.each do |position|
        #debugger
        valid_moves << position if board.valid_pos?(position)
      end
    else 
      arr = [
        [pos[0]+(1*forward_dir(@color)),pos[1]], #move forward once
        # [],#move left diagonal
        # []#move right diagonal
      ]
      arr.each do |positions|
        valid_moves << positions if board.valid_pos?(positions)
      end
      #debugger
      right_dia=[pos[0]+1*forward_dir(@color),pos[1]+1*forward_dir(@color)]
      left_dia = [pos[0]+1*forward_dir(@color),pos[1]-1*forward_dir(@color)]
      diag = [right_dia,left_dia]
      diag.each do |diagonal|
        # debugger
        if board[diagonal] != NullPiece.instance && board[diagonal].color != self.color
          valid_moves << diagonal
        end
      end
    end
    return valid_moves
  end
  attr_accessor :pos

  private 
  def at_start_row?
    (pos[0] == 1 || pos[0] == 6)
  end

  def forward_dir(color)
    return 1 if color == "white"
    return -1 if color == "black"
  end

  # def forward_steps(current_pos)
  #   if at_start_row
  #    temp_x, temp_y = current_pos 
  #   end 
  # end
end 