import Foundation


class Test {
    
    enum File: String {
        case input = "in"
        case output = "out"
    }
    
    static private let fileManager = FileManager.default
    
    private init() {}
    
    static func run() {
        checkKing()
        print("-----------")
        checkKnight()
        print("-----------")
        checkRook()
        print("-----------")
        checkBishop()
        print("-----------")
        checkQueen()
    }
    
    static private func checkKing() {
        
        for index in 0...9 {
            let inputTestValue = getDataFrom(path: "Test/King/test.\(index).\(File.input.rawValue)").replacingOccurrences(of: "\n", with: "", options: .caseInsensitive)
            
            let king = King(position: Int(inputTestValue)!)
            king.steps()
            king.countPossibleMoves()
            
            let outputTestValue = getDataFrom(path: "Test/King/test.\(index).\(File.output.rawValue)").split(separator: "\r\n")
            
            
            if king.countSteps == Int(outputTestValue[0])! && king.mask == UInt64(outputTestValue[1])! {
                print("Test №\(index) in: \(inputTestValue) out: \(outputTestValue)")
            } else {
                print("Test \(index) is failed")
                break
            }
        }
    }
    
    static private func checkKnight() {
        
        for index in 0...9 {
            let inputTestValue = getDataFrom(path: "Test/Knight/test.\(index).\(File.input.rawValue)").replacingOccurrences(of: "\n", with: "", options: .caseInsensitive)
            
            let knight = Knight(position: Int(inputTestValue)!)
            knight.steps()
            knight.countPossibleMoves()
            
            let outputTestValue = getDataFrom(path: "Test/Knight/test.\(index).\(File.output.rawValue)").split(separator: "\r\n")
            
            
            if knight.countSteps == Int(outputTestValue[0])! && knight.mask == UInt64(outputTestValue[1])! {
                print("Test №\(index) in: \(inputTestValue) out: \(outputTestValue)")
            } else {
                print("Test \(index) is failed")
                break
            }
        }
    }
    
    static private func checkRook() {
        
        for index in 0...9 {
            let inputTestValue = getDataFrom(path: "Test/Rook/test.\(index).\(File.input.rawValue)").replacingOccurrences(of: "\n", with: "", options: .caseInsensitive)
            
            let rook = Rook(position: Int(inputTestValue)!)
            rook.steps()
            rook.countPossibleMoves()
            
            let outputTestValue = getDataFrom(path: "Test/Rook/test.\(index).\(File.output.rawValue)").split(separator: "\r\n")
            
            
            if rook.countSteps == Int(outputTestValue[0])! && rook.mask == UInt64(outputTestValue[1])! {
                print("Test №\(index) in: \(inputTestValue) out: \(outputTestValue)")
            } else {
                print("Test \(index) is failed")
                break
            }
        }
    }
    
    static private func checkBishop() {
        
        for index in 0...9 {
            let inputTestValue = getDataFrom(path: "Test/Bishop/test.\(index).\(File.input.rawValue)").replacingOccurrences(of: "\n", with: "", options: .caseInsensitive)
            
            let bishop = Bishop(position: Int(inputTestValue)!)
            bishop.steps()
            bishop.countPossibleMoves()
            
            let outputTestValue = getDataFrom(path: "Test/Bishop/test.\(index).\(File.output.rawValue)").split(separator: "\r\n")
            
            
            if bishop.countSteps == Int(outputTestValue[0])! && bishop.mask == UInt64(outputTestValue[1])! {
                print("Test №\(index) in: \(inputTestValue) out: \(outputTestValue)")
            } else {
                print("Test \(index) is failed")
                break
            }
        }
    }
    
    static private func checkQueen() {
        
        for index in 0...9 {
            let inputTestValue = getDataFrom(path: "Test/Queen/test.\(index).\(File.input.rawValue)").replacingOccurrences(of: "\n", with: "", options: .caseInsensitive)
            
            let queen = Queen(position: Int(inputTestValue)!)
            queen.steps()
            queen.countPossibleMoves()
            
            let outputTestValue = getDataFrom(path: "Test/Queen/test.\(index).\(File.output.rawValue)").split(separator: "\r\n")
            
            
            if queen.countSteps == Int(outputTestValue[0])! && queen.mask == UInt64(outputTestValue[1])! {
                print("Test №\(index) in: \(inputTestValue) out: \(outputTestValue)")
            } else {
                print("Test \(index) is failed")
                break
            }
        }
    }
    
    static private func getDataFrom(path: String) -> String {
        
        if fileManager.fileExists(atPath: path) {
            do {
                let fileContents = try String(contentsOfFile: path, encoding: .utf8)
                return fileContents
            } catch {
                print("Error reading file: \(error.localizedDescription)")
                return "-2"
            }
        } else {
            print("File does not exist")
            return "-1"
        }
    }
}






