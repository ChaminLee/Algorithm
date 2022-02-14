// Logic
// 1. 높이 N인 경우 잠기지 않는 영역의 개수를 세어준다. (비가 오지 않는 경우도 세어줘야 한다!!!)
// 2. 최대 높이-1까지 1번 탐색을 진행하며, 영역을 배열에 담아준다.
// 3. 영역의 배열에서 가장 높은 값을 반환

// Solution
import Foundation

let n = Int(readLine()!)!
let dir = [0, -1, 0, 1, 0]
var areas = [[Int]](repeating: [], count: n)
var visited = Array(repeating: Array(repeating: false, count: n), count: n)

for i in 0..<n {
    let input2 = readLine()!.split(separator: " ").map { Int(String($0))! }
    areas[i] = input2
}

func findSafeArea(_ start: (Int,Int), _ waterLevel: Int) {
    var willVisit = [start]
    
    while !willVisit.isEmpty {
        let next = willVisit.removeFirst()
        
        for i in 0..<4 {
            let newX = next.0 + dir[i]
            let newY = next.1 + dir[i+1]
            
            if (newX >= 0 && newX < n) && (newY >= 0 && newY < n) {
                if !visited[newX][newY] && areas[newX][newY] > waterLevel {
                    visited[newX][newY] = true
                    willVisit.append((newX, newY))
                }
            }
        }
    }
}

var maxAreas = Int.min
let maxNum = areas.flatMap { $0 }.max()!

func getMaxSafeArea(_ waterLevel: Int) {
    var cnt = 0
    for i in 0..<n {
        for j in 0..<n {
            if !visited[i][j] && areas[i][j] > waterLevel {
                visited[i][j] = true
                cnt += 1
                findSafeArea((i,j), waterLevel)
            }
        }
    }
    maxAreas = max(maxAreas, cnt)
}

for i in 0..<maxNum {
    visited = Array(repeating: Array(repeating: false, count: n), count: n)
    getMaxSafeArea(i)
}


print(maxAreas)
