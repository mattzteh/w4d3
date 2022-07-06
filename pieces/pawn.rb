require_relative "./piece.rb"

class Pawn < Piece

    def to_s
        if self.color == "White"
            @value = "♙"
        else
            @value = "♟"
        end
    end
end