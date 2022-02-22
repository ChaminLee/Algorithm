import Foundation

let n = Int(readLine()!)!

for _ in 0..<n {
    let result = readLine()!.split(separator: " ").map { Int(String($0))! }.sorted { $0 > $1 }[2]
    print(result)
}
