require_relative "piece"
require_relative "slideable"

class Rook < Piece
    include Slideable


moves = [[1, 0], [0, 1], [-1, 0], [0, -1]]


    def to_s
        if self.color == "White"
            "♖"
        else
            "♜"
        end
    end

    def move_dirs(pos)
        return grow_unblock_moves(pos, moves)
    end

end