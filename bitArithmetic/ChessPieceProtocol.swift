import Foundation

protocol ChessPieceProtocol {
    var mask: UInt64 { get set }
    var countSteps: Int { get set}
    
    func steps()
    func countPossibleMoves()
}
