import Foundation


enum ChessPiece: String {
    case empty = " "
    case whitePawn = "♙"
    case whiteKnight = "♘"
    case whiteBishop = "♗"
    case whiteRook = "♖"
    case whiteQueen = "♕"
    case whiteKing = "♔"
    case blackPawn = "♟"
    case blackKnight = "♞"
    case blackBishop = "♝"
    case blackRook = "♜"
    case blackQueen = "♛"
    case blackKing = "♚"
    
    func printPiece() -> String {
        return self.rawValue
    }
}

class ChessBoard {
    var board: [[ChessPiece]]
    
    init() {
        self.board = [
            [.empty, .empty, .empty, .empty, .empty, .empty, .empty, .empty],
            [.empty, .empty, .empty, .empty, .empty, .empty, .empty, .empty],
            [.empty, .empty, .empty, .empty, .empty, .empty, .empty, .empty],
            [.empty, .empty, .empty, .empty, .empty, .empty, .empty, .empty],
            [.empty, .empty, .empty, .empty, .empty, .empty, .empty, .empty],
            [.empty, .empty, .empty, .empty, .empty, .empty, .empty, .empty],
            [.empty, .empty, .empty, .empty, .empty, .empty, .empty, .empty],
            [.empty, .empty, .empty, .empty, .empty, .empty, .empty, .empty]
        ]
    }
    
    func printBoard() {
        // Print column labels
        print("    a   b   c   d   e   f   g   h")
        
        // Print upper border
        print("  +---+---+---+---+---+---+---+---+")
        
        for (rowIndex, row) in board.reversed().enumerated() {
            let rowLabel = 8 - rowIndex
            var rowOutput = "\(rowLabel) |"
            for (colIndex, piece) in row.enumerated() {
                let isBlackSquare = (rowIndex + colIndex) % 2 == 0
                let cellContent = piece.printPiece()
                rowOutput += isBlackSquare ? " \(cellContent) |" : " \(cellContent) |"
            }
            print(rowOutput)
            print("  +---+---+---+---+---+---+---+---+")
        }
    }
    
    func set(piece: ChessPiece, to position: (Int, Int)) {
        board[position.0][position.1] = piece
    }
    
    func movePiece(from start: (Int, Int), to end: (Int, Int)) {
        let piece = board[start.0][start.1]
        board[start.0][start.1] = .empty
        board[end.0][end.1] = piece
    }
}


