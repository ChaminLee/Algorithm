// Logic
// 1. brute force
// 2. 1부터 분해합 더해서 최초로 나오는 값을 출력

// Solution
import Foundation

let target = Int(readLine()!)!

func partialSum(_ n: Int) -> Int {
    var sum = 0
    String(n).map {
        sum += Int($0.description)!
    }
    return sum
}

func solution() -> Int {
    for n in 1...target {
        if n + partialSum(n) == target {
            return n
        }
    }
    
    return 0
}

print(solution())
