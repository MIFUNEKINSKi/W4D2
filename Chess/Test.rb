require_relative "board"
require_relative "pieces"
require "byebug"
board = Board.new
a = board.dup
a.move_piece("white",[1,0],[2,0])
board.board_print
# a.board_print
# p board.king_pos("white")
p board.are_we_in_check?("white")