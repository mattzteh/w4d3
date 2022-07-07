
module Slideable
    
    diag_moves = [[1, 1], [1, -1], [-1, 1], [-1, -1]]
    horz_moves = [[1, 0], [0, 1], [-1, 0], [0, -1]]

    def moves
        #call on a given piece, and build a complete array of
        #all possible positions
        #returns 2D array
        #iterate through all directions to find positions



    end

    def grow_unblock_moves(pos, moves)
        
        all_moves = []  
        moves.each do |move|
            row, col = pos
            new_row, new_col = move
            loop do
                row += new_row
                col += new_col
                curr_pos = [row, col]
                break if !board.valid_pos?(curr_pos) || self.color == board[curr_pos].color

                if self.color != board[curr_pos].color
                    all_moves << curr_pos
                    break
                end
                if board.empty?(curr_pos)
                    all_moves << curr_pos
                end
            end
        end
        all_moves.uniq
    end


end