import Foundation
let n = Int(readLine()!)!

for _ in 0..<n {
    let input = Int(readLine()!)!
    String(input, radix: 2).reversed().enumerated().filter { $0.element == "1" }.map {
        print($0.offset, terminator: " ")
    }
}

