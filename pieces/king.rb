require_relative "./piece.rb"
class King < Piece
 
    def to_s
        if self.color == "White"
            @value = "♔"
        else
            @value = "♚"
        end
    end
end