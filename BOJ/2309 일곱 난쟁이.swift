import Foundation

var arr = [Int]()

for _ in 0..<9 {
    let n = Int(readLine()!)!
    arr.append(n)
}

let total = arr.reduce(0, +) - 100
arr.sort() { $0 < $1 }

outer: for i in 0..<8 {
    for j in i+1..<9 {
        if total == arr[i] + arr[j] {
            arr.remove(at: i)
            arr.remove(at: j-1)
            break outer
        }
    }
}

arr.map {
    print($0)
}
