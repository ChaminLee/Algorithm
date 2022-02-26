// Logic
// 1. 상어를 기점으로 최소 거리를 업데이트함(bfs)
// 2. 미리 상어 위치를 담아둔다
// 3. 상어 위치를 기준으로 이동하며 최소 거리를 업데이트 한다.
// 4. grid의 최댓값 - 1이 최대 안전거리가 된다

// Solution
import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let row = input[0], col = input[1]
let dx = [0,0,1,1,1,-1,-1,-1]
let dy = [1,-1,0,-1,1,0,1,-1]
var grid = [[Int]](repeating: [], count: row)
var queue = [[Int]]()

for i in 0..<row {
    let input2 = readLine()!.split(separator: " ").map { Int(String($0))! }
    queue.append(contentsOf: input2.enumerated().filter { $0.element == 1 }.map { [i, $0.offset] })
    grid[i] = input2
}

func bfs(_ start: (Int, Int)) {
    var visited = Array(repeating: Array(repeating: false, count: col), count: row)
    var willVisit = [start]
    
    while !willVisit.isEmpty {
        let now = willVisit.removeFirst()
        
        for i in 0..<dx.count {
            let newX = now.0 + dx[i]
            let newY = now.1 + dy[i]
            
            if (0..<row).contains(newX) && (0..<col).contains(newY) {
                if !visited[newX][newY] {
                    visited[newX][newY] = true
                    if grid[newX][newY] == 0 {
                        grid[newX][newY] = grid[now.0][now.1] + 1
                    } else {
                        grid[newX][newY] = min(grid[newX][newY], grid[now.0][now.1] + 1)
                    }
                    
                    willVisit.append((newX, newY))
                }
            }
        }
    }
}

while !queue.isEmpty {
    let now = queue.removeFirst()
    bfs((now[0], now[1]))
}

print(grid.map { $0.max()! }.max()! - 1)
