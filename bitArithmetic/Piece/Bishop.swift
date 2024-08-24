import Foundation


class Bishop: ChessPieceProtocol {
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

        var i = 1
        while row - i >= 0 && file - i >= 0 {
            let square = (row - i) * 8 + file - i
            temp = 1 << UInt64(square)
            if temp & bb == 0 {
                mask |= temp
            } else {
                break
            }
            i += 1
        }
        i = 1
        while row + i < 8 && file + i < 8 {
            let square = (row + i) * 8 + file + i
            temp = 1 << UInt64(square)
            if temp & bb == 0 {
                mask |= temp
            } else {
                break
            }
            i += 1
        }


        i = 1
        while row - i >= 0 && file + i < 8 {
            let square = (row - i) * 8 + file + i
            temp = 1 << UInt64(square)
            if temp & bb == 0 {
                mask |= temp
            } else {
                break
            }
            i += 1
        }
        
        i = 1
        while row + i < 8 && file - i >= 0 {
            let square = (row + i) * 8 + file - i
            temp = 1 << UInt64(square)
            if temp & bb == 0 {
                mask |= temp
            } else {
                break
            }
            i += 1
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
