// Logic
// 1. 간선들의 비용을 2차원 배열 cost에 담아준다.
// 2. 방문 여부를 담아줄 1차원 배열 visited 생성
// 3. 주어진 정보로 cost를 채운다
// 4. 실제 비용을 담아주기 위한 1차원 배열 realCost 생성
// 5. 시작점 기준으로 출발하기에, 시작점의 비용은 무조건 0이어야 함. 초기 세팅 필요
// 6. 시작점과 연결된 간선들의 번호, 비용을 순회하며 realCost를 업데이트해준다.
// 7. 다음 방문 지점은 우선 방문하지 않았어야 하고, 비용이 최소값인 index여야 한다.

// Solution
import Foundation

let n = Int(readLine()!)!
let m = Int(readLine()!)!

var cost = [[(Int,Int)]](repeating: [], count: n)
var visited = Array(repeating: false, count: n)

for _ in 0..<m {
    let info = readLine()!.split(separator: " ").map { Int(String($0))! }
    cost[info[0]-1].append((info[1]-1, info[2]))
}

var city = readLine()!.split(separator: " ").map { Int(String($0))! }
let start = city[0] - 1, end = city[1] - 1
var realCost = Array(repeating: Int.max, count: n)
realCost[start] = 0

func move(_ start: Int) {
    if start == end {
        return
    }
    
    visited[start] = true
    for (end, value) in cost[start] {
        realCost[end] = min(realCost[end], realCost[start] + value)
    }
    
    let next = realCost.enumerated()
        .filter { !visited[$0.offset] }
        .min(by: { $0.element < $1.element })!
        .offset
    move(next)
}

move(start)
print(realCost[end])
