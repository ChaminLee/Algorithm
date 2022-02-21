import Foundation
let n = Int(readLine()!)!

let arr = readLine()!.split(separator: " ").map { Int(String($0))! }

print("\(arr.min()!) \(arr.max()!)")
