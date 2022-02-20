// Logic
// 1. 정렬
// 2. binary search 구현

// Solution
import Foundation

let n = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").map { Int(String($0))! }
arr.sort { $0 < $1 }

let m = Int(readLine()!)!
let targets = readLine()!.split(separator: " ").map { Int(String($0))! }

func binarySearch(_ target: Int) -> Int {
    var lhs = 0, rhs = arr.count - 1
    
    if arr[lhs] > target || arr[rhs] < target {
        return 0
    }
    
    while lhs < rhs {
        let mid = (lhs + rhs) / 2
        
        if arr[mid] > target {
            rhs = mid - 1
        } else if arr[mid] < target {
            lhs = mid + 1
        } else {
            return 1
        }
    }
    
    return arr[lhs] == target ? 1 : 0
}

for i in 0..<m {
    print(binarySearch(targets[i]))
}
