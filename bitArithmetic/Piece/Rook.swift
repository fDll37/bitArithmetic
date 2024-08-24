import Foundation


class Rook: ChessPieceProtocol {
    var countSteps: Int = 0
    var mask: UInt64 = 0
    var bb: UInt64
    var position: Int
    
    init(position: Int) {
        self.position = position
        bb = 1 << UInt64(position)
    }
    
    func steps() {
        var temp: UInt64
        let row = position / 8
        let file = position % 8
        
        // Horizontal movements
        for i in 0..<8 {
            let square = row * 8 + i
            if i != file {
                temp = 1 << UInt64(square)
                if temp & bb == 0 {
                    mask |= temp
                }
            }
        }
        
        // Vertical movements
        for i in 0..<8 {
            let square = i * 8 + file
            if i != row {
                temp = 1 << UInt64(square)
                if temp & bb == 0 {
                    mask |= temp
                }
            }
        }
        
        bb = mask
    }
    
    func countPossibleMoves() {
        while bb > 0 {
            countSteps += 1
            bb &= (bb - 1)
        }
    }
}
