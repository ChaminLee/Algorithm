// Logic
// 1. x-1, x+1, 2x 이동 방식들을 각각 bfs 방식으로 계속 탐방
// 2. (현재값, 현재시간) 유지하며 이동
// 3. 값이 같으면 반환, 이동한 값이 음수이면 패스
// 4. 방문하지 않은 수여야 하고, 0 이상, 100000 이하여야 함
// 5. bro가 더 뒤에 있는 경우는 그냥 빼주면 됨

// Solution
import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }

let subin = input[0]
var bro = input[1]
var visited = Set<Int>()

func bfs() -> Int {
    var nextVisit = [(subin, 0)]
    
    while !nextVisit.isEmpty {
        let next = nextVisit.removeFirst()
        
        if next.0 == bro {
            return next.1
        } else if next.0 < 0 {
            continue
        }
        
        for n in [next.0 - 1, next.0 + 1, next.0 * 2] {
            if !visited.contains(n) && n >= 0 && n <= 100000 {
                nextVisit.append((n, next.1 + 1))
                visited.insert(n)
            }
        }
    }
    
    return -1
}

if subin > bro {
    print(subin - bro)
} else {
    print(bfs())
}
