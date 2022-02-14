// Logic
// 1. 좌측 상단에서 시작하여 우측 하단으로 이동해야함
// 2. bfs로 이동할 때 마다 이전 위치의 값 추가
// 3. (row-1, col-1)에 해당하는 값 반환

// Solution
import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let row = input[0]
let col = input[1]
let dir = [0, 1, 0, -1, 0]
var maze = [[Int]](repeating: [], count: row)
var visited = Array(repeating: Array(repeating: false, count: col), count: row)

for i in 0..<row {
    let input2 = readLine()!.map { Int(String($0))! }
    maze[i] = input2
}

visited[0][0] = true

func bfs() {
    var willVisit = [(0,0)]
    
    while !willVisit.isEmpty {
        let next = willVisit.removeFirst()
        
        for i in 0..<4 {
            let newX = next.0 + dir[i]
            let newY = next.1 + dir[i+1]
            
            if (newX >= 0 && newX < row) && (newY >= 0 && newY < col) && maze[newX][newY] == 1 {
                if !visited[newX][newY] {
                    willVisit.append((newX, newY))
                    visited[newX][newY] = true
                    maze[newX][newY] += maze[next.0][next.1]
                }
            }
        }
    }
}

bfs()

print(maze[row-1][col-1])
