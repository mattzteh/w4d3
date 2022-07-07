
class Piece
    
    attr_reader :color, :board
    attr_accessor :pos

    def initialize(color, board, pos)
        @color = color
        @board = board
        @pos = pos
   
    end

    def valid_pos?(pos)
        row, col = pos
        raise "not valid position" if row >= 0 && row <= 7 && col >= 0 && col <= 7
    end

end