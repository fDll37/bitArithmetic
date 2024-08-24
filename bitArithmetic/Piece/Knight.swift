import Foundation

class Knight: ChessPieceProtocol {
    var countSteps: Int = 0
    var mask: UInt64 = 0
    var bb: UInt64
    
    init(position: Int) {
        bb = 1 << UInt64(position)
    }
    
    func steps() {
        
        mask = BoardMask.nGH & (bb << 6 | bb >> 10)
        mask |= BoardMask.nH & (bb << 15 | bb >> 17)
        mask |= BoardMask.nA & (bb << 17 | bb >> 15)
        mask |= BoardMask.nAB & (bb << 10 | bb >> 6)
        bb = mask
    }
    
    func countPossibleMoves() {
        while bb > 0 {
            countSteps += 1
            bb &= (bb - 1)
        }
    }
}
