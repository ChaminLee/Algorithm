// Logic
// 1. bfs로 탐색
// 2. 이미 연산한 것들은 담아두고 중복없도록 확인
// 3. 중간에 결과가 target을 넘어서는 경우는 더 이상 고려하지 않도록 continue
// 4. target보다 작다면 계속 연산 진행
// 5. target과 같은 경우 현재 step 반환

// Solution
import Foundation

let numbers = readLine()!.split(separator: " ").map { Int(String($0))! }
var start = numbers[0], target = numbers[1]
var visited = Set<Int>()

func bfs() -> Int {
    var nextVisit = [(start, 1)]
    
    while !nextVisit.isEmpty {
        let next = nextVisit.removeFirst()
                
        if next.0 == target {
            return next.1
        } else if next.0 > target {
            continue
        }
        
        for n in [next.0 * 2, (next.0 * 10) + 1] {
            if !visited.contains(n) {
                visited.insert(n)
                nextVisit.append((n, next.1 + 1))
            }
        }
    }
    
    return -1
}

let result = bfs()
print(result)

