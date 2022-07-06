require_relative 'pieces.rb'

class Board
    attr_reader :rows

    def initialize
        @rows = Array.new(8) {Array.new(8, NullPiece.instance)}
        populate


    end

    def print_board
        @rows.each do |row|
            p row.join(' ')
        end
    end

    def [](pos)
        row, col = pos
        @rows[row][col]
    end

    def []=(pos, val)
        row, col = pos
        @rows[row][col] = val
    end

    def move_piece(color, start_pos, end_pos)
        row, col = end_pos

        raise Error if self[start_pos].color != color || !valid_pos?(start_pos) 
        raise Error if self[end_pos].color == color || !valid_pos?(end_pos)
        true
    end

    def move_piece!(color, start_pos, end_pos)
        if move_piece(color, start_pos, end_pos)
            row, col = end_pos
            self[end_pos] = self[start_pos]
            self[end_pos].pos = end_pos
            self[start_pos] = NullPiece.instance 
        end
    end

    def valid_pos?(pos)
        row, col = pos
        row >= 0 && row <= 7 && col >= 0 && col <= 7
    end

    def add_piece(piece, pos)
    end

    def checkmate?(color)
    end

    def in_check?(color)
    end

    def find_king(color)
    end
    def populate
        @rows.each_with_index do |sub, i|
            sub.each_with_index do |ele, j|
               @rows[i][j] = Rook.new("Black", self, [i, j]) if i == 0 && j == 0 || i == 0 && j == 7
               @rows[i][j] = Knight.new("Black", self, [i, j]) if i == 0 && j == 1 || i == 0 && j == 6
               @rows[i][j] = Bishop.new("Black", self, [i, j]) if i == 0 && j == 2 || i == 0 && j == 5
               @rows[i][j] = Queen.new("Black", self, [i, j]) if i == 0 && j == 3
               @rows[i][j] = King.new("Black", self, [i, j]) if i == 0 && j == 4
               @rows[i][j] = Pawn.new("Black", self, [i, j]) if i == 1 

               @rows[i][j] = Rook.new("White", self, [i, j]) if i == 7 && j == 0 || i == 7 && j == 7
               @rows[i][j] = Knight.new("White", self, [i, j]) if i == 7 && j == 1 || i == 7 && j == 6
               @rows[i][j] = Bishop.new("White", self, [i, j]) if i == 7 && j == 2 || i == 7 && j == 5
               @rows[i][j] = Queen.new("White", self, [i, j]) if i == 7 && j == 3
               @rows[i][j] = King.new("White", self, [i, j]) if i == 7 && j == 4
               @rows[i][j] = Pawn.new("White", self, [i, j]) if i == 6
            #    @rows[i][j]=NullPiece.instance.to_s

            end


        end
    end
   
end

b = Board.new
b.print_board
p b.move_piece!("Black", [0,0], [4,0])
b.print_board

