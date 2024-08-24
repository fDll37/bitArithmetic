import Foundation

class HelpFunction {
    
    static func binaryChunks(of number: UInt64, chunkSize: Int = 8) -> [String] {
        let binaryString = String(number, radix: 2)
        let paddedBinaryString = String(repeating: "0", count: max(chunkSize - binaryString.count % chunkSize, 0)) + binaryString
        var chunks: [String] = []
        
        for i in stride(from: 0, to: paddedBinaryString.count, by: chunkSize) {
            let startIndex = paddedBinaryString.index(paddedBinaryString.startIndex, offsetBy: i)
            let endIndex = paddedBinaryString.index(startIndex, offsetBy: chunkSize, limitedBy: paddedBinaryString.endIndex) ?? paddedBinaryString.endIndex
            let chunk = String(paddedBinaryString[startIndex..<endIndex])
            chunks.append(chunk)
        }
        
        return chunks
    }
    
}
