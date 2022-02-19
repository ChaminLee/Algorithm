// Logic
// 1. BFS로 최선의 답 찾기
// 2. (현재 층, 시도 횟수) 담아서 BFS 돌기
// 3. 1층 이상, 최대층 이하로만 이동 가능하다
// 4. -1이 반환되면 계단 이동하라고 출력, 타겟과 같다면 시도 횟수 출력

// Solution
import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }

let totalFloors = input[0], now = input[1], target = input[2], up = input[3], down = input[4]
var visited = Set<Int>()

func bfs() -> Int {
    var willVisit = [(now, 0)]
    
    while !willVisit.isEmpty {
        let next = willVisit.removeFirst()
        
        if next.0 == target {
            return next.1
        }
        
        for new in [next.0 + up, next.0 - down] {
            if !visited.contains(new) && new > 0 && new <= totalFloors {
                visited.insert(new)
                willVisit.append((new, next.1 + 1))
            }
        }
    }
    
    return -1
}

let result = bfs()
print(result == -1 ? "use the stairs" : result)
