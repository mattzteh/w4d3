require_relative "./piece.rb"

class Bishop < Piece

    def to_s
        if self.color == "White"
            @value = "♗"
        else
            @value = "♝"
        end
    end
end