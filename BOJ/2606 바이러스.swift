// Logic
// 1. 양방향 연결 정보를 배열에 담아준다.
// 2. BFS로 탐색하여 방문한 컴퓨터 번호를 담는다
// 3. 출발지인 1를 제외하고 총 개수를 세어 반환

// Solution
import Foundation

let n = Int(readLine()!)!
let connectCount = Int(readLine()!)!
var connect = [[Int]](repeating: [], count: n)
var visited = Set<Int>()

for _ in 0..<connectCount {
    let input2 = readLine()!.split(separator: " ").map { Int(String($0))! }
    connect[input2[0]-1].append(input2[1])
    connect[input2[1]-1].append(input2[0])
}

func bfs() {
    var willVisit = [1]
    visited.insert(1)
    
    while !willVisit.isEmpty {
        let next = willVisit.removeFirst()
        
        for n in connect[next-1] {
            if !visited.contains(n) {
                visited.insert(n)
                willVisit.append(n)
            }
        }
    }
}

bfs()
print(visited.count - 1)
