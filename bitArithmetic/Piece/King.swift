import Foundation


class King: ChessPieceProtocol {
    var countSteps: Int = 0
    var mask: UInt64 = 0
    var bb: UInt64
    
    init(position: Int) {
        bb = 1 << UInt64(position)
    }
    
    func steps() {
        var mask: UInt64 = (bb & BoardMask.nH) << 1
        mask |= (bb & BoardMask.nA) >> 1
        mask |= bb << 8
        mask |= bb >> 8
        mask |= (bb & BoardMask.nA) >> 9
        mask |= (bb & BoardMask.nA) << 7
        mask |= (bb & BoardMask.nH) << 9
        mask |= (bb & BoardMask.nH) >> 7
        bb = mask
        self.mask = mask
    }
    
    func countPossibleMoves() {
        while bb > 0 {
            countSteps += 1
            bb &= (bb - 1)
        }
    }
}
